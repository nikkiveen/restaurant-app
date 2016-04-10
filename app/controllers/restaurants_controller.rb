class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.html.erb'
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
