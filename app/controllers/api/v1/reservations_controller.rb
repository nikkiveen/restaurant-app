class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render 'index.json.jbuilder'
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end
end
