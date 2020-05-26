class UsersController < ApplicationController

  def index
   if params[:query].present?
      @users = User.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @user = User.all
    end
  end
end
