class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trip = Trip.new
    @venues = Venue.reviewed.first(3)

  end

  def profile
    @user = current_user
    @trips = @user.trips
  end
end
