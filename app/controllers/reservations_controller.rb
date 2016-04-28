class ReservationsController < ApplicationController
  def create
    head_count = params[:head_count].to_i
    available_seats = Seat.where("restaurant_id = ? AND date = ? AND timeslot_id = ? AND status = ?", params[:restaurant_id], params[:reservation][:date], params[:timeslot][:timeslot_id], "Available")

    if available_seats.length >= head_count
      reservation = Reservation.create(
        diner_id: current_diner.id, 
        date: params[:reservation][:date],
        timeslot_id: params[:timeslot][:timeslot_id],
        head_count: params[:head_count]
      )

      head_count.times do 
        available_seat = Seat.where("restaurant_id = ? AND date = ? AND timeslot_id = ? AND status = ?", params[:restaurant_id], params[:reservation][:date], params[:timeslot][:timeslot_id], "Available").first
        available_seat.update(
          status: "Reserved",
          reservation_id: reservation.id
        )
      end

      flash[:success] = "Seat successfully reserved!"
    else
      flash[:error] = "No Seats Available!"  
    end
    redirect_to '/restaurants'
  end
end
