class TripVenuesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @venue = Venue.find(params[:venue_id])
    TripVenue.create(trip: @trip, venue: @venue)
    @venues = Venue.near([@trip.latitude, @trip.longitude], @trip.radius)

    if params[:filter] && params[:filter][:query].present?
      @query = params[:filter][:query]
      @venues = @venues.search_by_category(params[:filter][:query])
    end
  end

  def destroy
    @trip_venue = TripVenue.find(params[:id])
    @trip = @trip_venue.trip
    @trip_venue.destroy
    @venues = Venue.near([@trip.latitude, @trip.longitude], @trip.radius)
  end

  private

  def trip_venue_params
    params.require(:trip_venue).permit(:trip_id, :venue_id)
  end
end

