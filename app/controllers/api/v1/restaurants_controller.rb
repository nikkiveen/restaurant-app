class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render 'index.json.jbuilder'
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end
end

