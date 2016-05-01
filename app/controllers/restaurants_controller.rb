class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.html.erb'
  end

  def new
    @restaurant = Restaurant.new
    render 'new.html.erb'
  end

  def create
    @restaurant = Restaurant.new(
      name: params[:input_name],
      address: params[:input_address],
      phone: params[:input_phone],
      email: params[:input_email],
      bio: params[:input_bio],
      max_reservation_size: params[:input_max_reservation_size],
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
    @timeslots = Timeslot.all
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
    @restaurant = Restaurant.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.update(
      name: params[:input_name],
      address: params[:input_address],
      phone: params[:input_phone],
      email: params[:input_email],
      bio: params[:input_bio],
      max_reservation_size: params[:input_max_reservation_size],
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
end
