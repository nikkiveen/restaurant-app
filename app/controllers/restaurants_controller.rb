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
    @head_counts = [1, 2, 3, 4, 5]
    render 'show.html.erb'
  end

  def edit
    render 'edit.html.erb'
  end

  def update
  end
end
