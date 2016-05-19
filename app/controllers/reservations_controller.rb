class ReservationsController < ApplicationController
  def index
    if current_diner
      @reservations = Reservation.where("diner_id = ?", current_diner.id)
      render 'index.html.erb'
    elsif current_restaurant_admin
      @reservations = Reservation.where("restaurant_id = ?", params[:restaurant_id])
    else
      redirect_to '/restaurants'
    end
  end

  def new
    if current_diner8
      @restaurant = Restaurant.find_by(id: params[:restaurant_id])

      @head_count_options = []
      head_count = @restaurant.max_reservation_size.to_i
      until head_count == 0
        @head_count_options << head_count
        head_count -= 1
      end
      @head_count_options.reverse!

      @timeslots = []
      Timeslot.all.each do |timeslot|
        if @restaurant.open_timeslot.to_i <= timeslot.id.to_i && timeslot.id.to_i <= @restaurant.close_timeslot.to_i
          @reservations = Reservation.where(restaurant_id: @restaurant.id, date: params[:reservation][:date], timeslot_id: timeslot.id)
          total_existing_head_count = 0
          @reservations.each do |reservation|
            total_existing_head_count += reservation.head_count
          end
          if total_existing_head_count < @restaurant.seats_per_timeslot
            @timeslots << timeslot
          end
        end
      end
      render 'new.html.erb'
    else
      redirect_to '/restaurants'
    end
  end

  def create
    existing_reservations = Reservation.where("restaurant_id = ? AND date = ? AND timeslot_id = ?", params[:restaurant_id], params[:date], params[:timeslot][:timeslot_id])
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    timeslot = Timeslot.find_by(id: params[:timeslot][:timeslot_id])
    datetime_string = params[:date].to_s + " " + timeslot.time + "-0500"
    datetime = DateTime.parse(datetime_string)
    total_existing_head_count = 0
    existing_reservations.each do |reservation|
      total_existing_head_count += reservation.head_count
    end

    if total_existing_head_count.to_i + params[:head_count].to_i <= restaurant.seats_per_timeslot.to_i
      @reservation = Reservation.new(
        diner_id: cuorrent_diner.id,
        diner_name: current_diner.first_name + " " + current_diner.last_name,
        diner_phone: current_diner.phone,
        date: params[:date],
        timeslot_id: params[:timeslot][:timeslot_id],
        datetime: datetime,
        restaurant_id: params[:restaurant_id],
        head_count: params[:head_count]
      )

      if @reservation.save
        @reservation.reminder
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

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    if @reservation.destroy
      flash[:success] = "Reservation successfully cancelled!"
      redirect_to "/restaurants"
    else
      flash[:warning] = "Error when cancelling reservation. Try again."
      redirect_to "/reservations/#{params[:id]}"
    end
  end
end