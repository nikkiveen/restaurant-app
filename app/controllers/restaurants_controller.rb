class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.html.erb'
  end

  def new
  end

  def create
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    @timeslots = Timeslot.all
    @head_counts = [1, 2, 3, 4, 5]
    render 'show.html.erb'
  end

end
