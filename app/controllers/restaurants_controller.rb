class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.html.erb'
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    @timeslots = Timeslot.all
    render 'show.html.erb'
  end
end
