class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trip = Trip.new
  end

  def profile
    @user = current_user
    @trips = @user.trips
  end

  def non_footer_action
    @skip_footer = true
  end
end
