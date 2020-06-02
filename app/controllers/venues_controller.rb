class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @review = Review.new
    @marker = [{
      lat: @venue.latitude,
      lng: @venue.longitude,
      infoWindow: render_to_string(partial: "/trips/info_window", locals: { venue: @venue }),
    }]
  end

private

  def venues_params
    params.require(:venue).permit(:name, :category, :address, :zip, :photo, :latitude, :longitude)
  end
end
