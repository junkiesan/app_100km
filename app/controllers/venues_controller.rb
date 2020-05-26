class VenuesController < ApplicationController

  def index
    @venue = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to trips_path(@venue)
    else
      render :show
    end
  end

  # def destroy
  #   @trip.venue.destroy
  #   redirect_to trips_path
  # end

private

  def venues_params
    params.require(:venue).permit(:name, :category, :address, :zip, :photo, :latitude, :longitude)
  end
end
