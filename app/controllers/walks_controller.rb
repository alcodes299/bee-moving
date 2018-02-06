class WalksController < ApplicationController
  def index
    @walks= Walk.all
  end
  def new
    @user = User.new
  end
  def create
    if current_user
    end
  end
end
