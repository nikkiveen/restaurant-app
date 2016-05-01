class Api::V1::RestaurantsController < ApplicationController
  def index
    render 'index.json.jbuilder'
  end
end
