class TimeslotsController < ApplicationController
  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    if current_restaurant_admin.id = @restaurant.restaurant_admin_id
      @timeslot_status = {}
      
      Timeslot.all.each do |timeslot|
        if @restaurant.open_timeslot.to_i <= timeslot.id.to_i && timeslot.id.to_i <= @restaurant.close_timeslot.to_i
          @reservations = Reservation.where(restaurant_id: @restaurant.id, date: Time.zone.today, timeslot_id: timeslot.id)
          
          total_existing_head_count = 0
          
          @reservations.each do |reservation|
            total_existing_head_count += reservation.head_count
          end

          total_remaining_head_count = @restaurant.seats_per_timeslot.to_i - total_existing_head_count.to_i

          @timeslot_status[timeslot.time] = total_remaining_head_count
        end
      end
      render 'show.html.erb'
    else
      redirect_to '/restaurants'
    end
  end
end
