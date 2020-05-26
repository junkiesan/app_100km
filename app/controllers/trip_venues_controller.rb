class TripVenuesController < ApplicationController

  def create
    @trip_venue = TripVenue.find(params[:id])
    if @trip_venue.save
      redirect_to trip_venue_path(@trip_venue)
    else
      render :new
    end
  end

  def destroy
    @trip_venue = TripVenue.find(params[:id])
    @trip_venue.destroy
    redirect_to trip_venue_path
  end
end
