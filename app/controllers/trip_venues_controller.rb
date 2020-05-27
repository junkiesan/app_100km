class TripVenuesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @venue = Venue.find(params[:venue_id])
    TripVenue.create(trip: @trip, venue: @venue)
    @venues = Venue.near([@trip.latitude, @trip.longitude], @trip.radius)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @trip.trip_venues.find_by(venue: Venue.find(params[:id])).destroy
    @venues = Venue.near([@trip.latitude, @trip.longitude], @trip.radius)
  end

  private

  def trip_venue_params
    params.require(:trip_venue).permit(:trip_id, :venue_id)
  end
end

