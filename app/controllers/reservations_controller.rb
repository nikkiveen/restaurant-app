class ReservationsController < ApplicationController
  def create
    available_seat = Seat.where("restaurant_id = ? AND date = ? AND timeslot_id = ? AND status = ?", params[:restaurant_id], params[:reservation][:date], params[:timeslot][:timeslot_id], "Available").first

    if available_seat
      Reservation.create(
        seat_id: available_seat.id,
        diner_id: current_diner.id, 
        date: params[:reservation][:date]
      )

      available_seat.update(
        status: "Reserved"
      )

      flash[:success] = "Seat successfully reserved!"
    else
      flash[:error] = "No Seats Available!"  
    end
    redirect_to '/restaurants'
  end
end
