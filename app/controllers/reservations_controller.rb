class ReservationsController < ApplicationController
  def create
    reservation = Reservation.new(
      diner_id: current_diner.id,
      date: params[:reservation][:date],
      timeslot_id: params[:timeslot][:timeslot_id],
      restaurant_id: params[:restaurant_id],
      head_count: params[:head_count]
    )
    if restaurant.save
      flash[:success] = "Seat successfully reserved!"
    else
      flash[:error] = "No Seats Available!"  
    end
    redirect_to '/restaurants'
  end
end
