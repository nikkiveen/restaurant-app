class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.json.jbuilder'
  end
end
