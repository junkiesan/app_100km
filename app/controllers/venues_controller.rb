class VenuesController < ApplicationController

  def index
    @venue = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

private

  def venues_params
    params.require(:venue).permit(:name, :category, :address, :zip, :photo, :latitude, :longitude)
  end
end
