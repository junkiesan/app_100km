class TripVenuesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @venue = Venue.find(params[:venue_id])
    TripVenue.create(trip: @trip, venue: @venue)
    @venues = Venue.near([@trip.latitude, @trip.longitude], @trip.radius)

    if params[:trip_venue] && params[:trip_venue][:query].present?
      @query = params[:trip_venue][:query]
      @venues = @venues.search_by_category(params[:trip_venue][:query])
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @trip_venue = TripVenue.find(params[:id])
    @trip = @trip_venue.trip
    @venue = @trip_venue.venue
    @trip_venue.destroy
    @venues = Venue.near([@trip.latitude, @trip.longitude], @trip.radius)

    if params[:trip_venue] && params[:trip_venue][:query].present?
      @query = params[:trip_venue][:query]
      @venues = @venues.search_by_category(params[:trip_venue][:query])
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def trip_venue_params
    params.require(:trip_venue).permit(:trip_id, :venue_id)
  end
end

