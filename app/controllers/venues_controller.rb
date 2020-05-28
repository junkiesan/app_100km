class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venues = Venue.find(params[:id])
    @review = Review.new
  end

private

  def venues_params
    params.require(:venue).permit(:name, :category, :address, :zip, :photo, :latitude, :longitude)
  end
end
