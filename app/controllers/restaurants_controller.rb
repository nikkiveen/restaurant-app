class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.html.erb'
  end

  def new
    if current_restaurant_admin
      @restaurant = Restaurant.new
      @timeslots = Timeslot.all
      render 'new.html.erb'
    else
      redirect_to '/restaurants'
    end
  end

  def create
    if current_restaurant_admin
      @timeslots = Timeslot.all
      @restaurant = Restaurant.new(
        name: params[:input_name],
        address: params[:input_address],
        city: params[:input_city],
        state: params[:input_state],
        zip: params[:input_zip],
        phone: params[:input_phone],
        email: params[:input_email],
        bio: params[:input_bio],
        total_seats: params[:input_total_seats],
        max_reservation_size: params[:input_max_reservation_size],
        seats_per_timeslot: params[:input_seats_per_timeslot],
        open_timeslot: params[:input_open_timeslot][:timeslot_id],
        close_timeslot: params[:input_close_timeslot][:timeslot_id],
        restaurant_admin_id: params[:restaurant_admin_id]
      )

      if @restaurant.save
        redirect_to "/restaurants/#{@restaurant.id}"
      else
        render 'new.html.erb'
      end
    else
      redirect_to '/restaurants'
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    all_timeslots = Timeslot.all
    @timeslots = []

    all_timeslots.each do |timeslot|
      if @restaurant.open_timeslot.to_i <= timeslot.id.to_i && timeslot.id.to_i <= @restaurant.close_timeslot.to_i
        @timeslots << timeslot
      end
    end
    @head_count_options = []
    head_count = @restaurant.max_reservation_size.to_i
    until head_count == 0
      @head_count_options << head_count
      head_count -= 1
    end
    @head_count_options.reverse!
    render 'show.html.erb'
  end

  def edit
    if current_restaurant_admin 
      @timeslots = Timeslot.all
      @restaurant = Restaurant.find_by(id: params[:id])
      render 'edit.html.erb'
    else
      redirect_to '/restaurants'
    end
  end

  def update
    if current_restaurant_admin
      @timeslots = Timeslot.all
      @restaurant = Restaurant.find_by(id: params[:id])
      if @restaurant.update(
        name: params[:input_name],
        address: params[:input_address],
        city: params[:input_city],
        state: params[:input_state],
        zip: params[:input_zip],
        phone: params[:input_phone],
        email: params[:input_email],
        bio: params[:input_bio],
        total_seats: params[:input_total_seats],
        max_reservation_size: params[:input_max_reservation_size],
        seats_per_timeslot: params[:input_seats_per_timeslot],
        open_timeslot: params[:input_open_timeslot][:timeslot_id],
        close_timeslot: params[:input_close_timeslot][:timeslot_id],
        restaurant_admin_id: params[:restaurant_admin_id]
      )
        redirect_to "/restaurants/#{@restaurant.id}"
      else
        render 'new.html.erb'
      end
    else
      redirect_to '/restaurants'
    end
  end

  def destroy
    if current_restaurant_admin
      @restaurant = Restaurant.find_by(id: params[:id])
      if @restaurant.destroy
        redirect_to "/restaurants"
      else
        redirect_to "/restaurants/#{params[:id]}"
      end
    else
      redirect_to '/restaurants'
    end
  end
end
