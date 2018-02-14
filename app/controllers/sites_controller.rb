class SitesController < ApplicationController
  def index
    @sites= Site.all
    @user = current_user
  end

  def show
    @site = Site.find(params[:id])
    
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
      redirect_to '/sites'
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
      flash[:notice] = 'Site failed to update'
      render :edit
    end
  end

 def destroy
   @site = Site.find(params[:id])
   if @site.destroy
     redirect_to '/sites'
     flash[:notice] = "Site Delete Successfully"
   else
     flash[:notice] = 'Site Failed to Delete'
     render :index
   end
 end

 protected

 def site_params
   params.require(:site).permit(:walk_id, :user_id, :title, :description, :location, :claimed, :flyer)
 end

end
