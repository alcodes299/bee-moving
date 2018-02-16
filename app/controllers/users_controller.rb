class UsersController < ApplicationController
  def index
    if current_user && current_user.admin?
      @sites = Site.all
      @users = User.all
      @walks = Walk.all
      @reviews = Review.all
    else
      redirect_to walks_path
      flash[:notice] = "You must be signed in as an admin"
    end
  end
end
