class ReservationsController < ApplicationController
  def create
    existing_reservations = Reservation.where("restaurant_id = ? AND date = ? AND timeslot_id = ?", params[:restaurant_id], params[:reservation][:date], params[:timeslot][:timeslot_id])
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    
    total_existing_head_count = 0
    existing_reservations.each do |reservation|
      total_existing_head_count += reservation.head_count
    end

    if total_existing_head_count.to_i + params[:head_count].to_i <= restaurant.seats_per_timeslot.to_i
      @reservation = Reservation.new(
        diner_id: current_diner.id,
        date: params[:reservation][:date],
        timeslot_id: params[:timeslot][:timeslot_id],
        restaurant_id: params[:restaurant_id],
        head_count: params[:head_count]
      )

      if @reservation.save
        flash[:success] = "Seat successfully reserved!"
        redirect_to "/reservations/#{@reservation.id}"
      else
        flash[:danger] = "Error saving!" 
        redirect_to "/restaurants/#{params[:restaurant_id]}" 
      end
    else
      flash[:danger] = "No Seats Available!"  
      redirect_to "/restaurants/#{params[:restaurant_id]}"
    end

    
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
  end
end
