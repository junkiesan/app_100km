class ReviewsController < ApplicationController

  def index
    @review = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    if @review.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :photos)
  end
end
