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
    def destroy
      @users = User.all
      @user = User.find(params[:id])
      if @user.destroy
        redirect_to "/users"
        flash[:notice] = "User has been deleted"
      else
        flash[:notice] = "User Failed to Delete"
        render :index
      end
    end
  end
end
