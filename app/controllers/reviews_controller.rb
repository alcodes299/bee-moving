class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "review added"
      redirect_to request.referrer, notice: "Review successfully added!"
    else
      flash[:error] = "Review failed to add!"
      @bob = @review.errors.full_messages
      redirect_to request.referrer
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to "/users"
      flash[:notice] = "Review Deleted!"
    else
      flash[:error] = "Review Failed to Delete!"
      render :index
    end
  end

  protected

  def review_params
    params.require(:review).permit(:walk_id, :rating, :description)
  end
end
