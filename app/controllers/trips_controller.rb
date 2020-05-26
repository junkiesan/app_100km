class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    # @trips = Trip.all
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trip_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id)
  end
end



