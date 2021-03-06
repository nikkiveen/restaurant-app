class RestaurantsController < ApplicationController
  before_action :authenticate_restaurant_admin!, except: [:index, :show, :run_search, :available]

  def index
    if current_restaurant_admin
      @restaurants = Restaurant.where("restaurant_admin_id = ?", current_restaurant_admin.id)
    else
      @restaurants = Restaurant.all
    end
    render 'index.html.erb'
  end

  def new
    @restaurant = Restaurant.new
    @timeslots = Timeslot.all
    render 'new.html.erb'
  end

  def create
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
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])

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
    @timeslots = Timeslot.all
    @restaurant = Restaurant.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
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
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.destroy
      redirect_to "/restaurants"
    else
      redirect_to "/restaurants/#{params[:id]}"
    end
  end

  def run_search
    search_term = params[:search]
    @restaurants = Restaurant.where("name LIKE ? OR city LIKE ? OR zip LIKE ?", "%" + search_term + "%", "%" + search_term + "%", "%" + search_term + "%")
    render 'index.html.erb'
  end

  def available
    @restaurants = []

    Restaurant.all.each do |restaurant|
      @reservations = Reservation.where(restaurant_id: restaurant.id, date: params[:reservation][:date], timeslot_id: params[:timeslot][:timeslot_id])
      @total_existing_head_count = 0
      @reservations.each do |reservation|
        @total_existing_head_count += reservation.head_count
      end
      if restaurant.seats_per_timeslot.to_i - @total_existing_head_count.to_i >= params[:head_count].to_i
        @restaurants << restaurant
      end
    end
    render 'index.html.erb'
  end

  private

  def authenticate_restaurant_admin
    unless restaurant_admin
      redirect_to '/restaurants'
    end
  end
end
