class SitesController < ApplicationController
  def index
    if current_user.keeper == true
      @sites= Site.all
      @user = current_user
    else
      redirect_to '/'
      flash[:error] = "You must be a beekeeper to view sites!"
    end
  end

  def show
    @site = Site.find(params[:id])
    @walk = Walk.find(@site.walk_id)
    @user = current_user
  end

  def new
    @walk = params[:walk_id].to_i
    @site = Site.new
    @user = current_user

  end

  def create
    @user = current_user
    @site=Site.new(site_params)
    if @site.save
      flash[:notice] = "Site add Successfull"
      if current_user.keeper == true
      redirect_to '/sites'
      else
        redirect_to '/walks'
      end
    else
      @bob = @site.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
    @site = Site.find(params[:id])
  end

  def update
    @user = current_user
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_path(@site)
      flash[:notice] = 'Site updated successfully'
    else
      flash[:error] = 'Site failed to update'
      render :edit
    end
  end

 def destroy
   @site = Site.find(params[:id])
   if @site.destroy
     redirect_to '/sites'
     flash[:notice] = "Site Delete Successfully"
   else
     flash[:error] = 'Site Failed to Delete'
     render :index
   end
 end

 protected

 def site_params
   params.require(:site).permit(:walk_id, :user_id, :title, :description, :longitude, :latitude, :claimed, :flyer)
 end

end
