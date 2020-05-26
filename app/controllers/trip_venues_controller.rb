class TripVenuesController < ApplicationController
  def show
    @trip_venue = TripVenue.find(params[:id])
  end
end
