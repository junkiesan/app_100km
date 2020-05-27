class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @trips = Trip.geocoded # returns trips with coordinates

    @trip_marker = [
      {
        lat: @trip.latitude,
        lng: @trip.longitude,
        trip: true
      }
    ]

    @venue_markers = @trip.venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "/trips/info_window", locals: { venue: venue })
      }
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params.merge(user: current_user))
    @trip.save
    redirect_to custom_trip_path(@trip)
  end

  def custom
    @trip = Trip.find(params[:id])
    @venues = Venue.near([@trip.latitude, @trip.longitude], @trip.radius)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  # def destroy
  #   @trip = Trip.find(params[:id])
  #   @trip.destroy
  #   redirect_to trip_path
  # end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :radius, :address, :user_id)
  end
end



