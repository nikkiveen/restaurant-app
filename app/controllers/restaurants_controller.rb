class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.html.erb'
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    @timeslots = ["5:00", "6:00", "7:00", "8:00", "9:00", "10:00"]
    render 'show.html.erb'
  end
end
