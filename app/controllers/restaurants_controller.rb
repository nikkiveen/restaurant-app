class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurants.all
    render 'index.html.erb'
  end

  def show
  end
end
