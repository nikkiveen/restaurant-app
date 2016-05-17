class LandingPagesController < ApplicationController
  def landing
    @head_count_options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @timeslots = Timeslot.all
    render 'landing.html.erb'
  end
end
