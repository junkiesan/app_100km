class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def profile
  end

end
