class ListingsController < ApplicationController
  def index
    @listing = Listing.paginate(page: params[:page])
  end

  def new
    @listing = Listing.new      
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
