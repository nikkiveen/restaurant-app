class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.html.erb'
  end

  def show
  end
end
