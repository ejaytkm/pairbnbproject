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
    @listing = Listing.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to :back
  end
end
