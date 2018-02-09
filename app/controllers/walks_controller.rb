class WalksController < ApplicationController
  def index
    @walks= Walk.all
  end

  def show
    @walk = Walk.find(params[:id])
    @sites = Site.all
    #walk.walk_params
    #user = current user
  end

  def new
    @user = current_user
    @walk = Walk.new
  end

  def create
    @walks = Walk.all
    @walk=Walk.new(walk_params)
    if @walk.save
      flash[:notice] = "Walk added successfully"
      redirect_to '/walks'
    else
      @bob = @walk.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
    @walk = Walk.find(params[:id])
  end


  def update
    @user = current_user
    @walk = Walk.find(params[:id])
    if @walk.update(walk_params)
      redirect_to walk_path(@walk)
      flash[:notice] = 'Walk updated successfully'
    else
      flash[:notice] = 'Walk failed to update'
      render :edit
    end
  end


  def destroy
    @walk = Walk.find(params[:id])
    if @walk.destroy
      redirect_to '/walks'
      flash[:notice] = "Walk deleted successfully"
    else
      flash[:notice] = 'Wizard deletion failed'
      render :index
    end
  end

  protected
  def walk_params
    params.require(:walk).permit(:user_id, :title, :description, :location )
  end
end
