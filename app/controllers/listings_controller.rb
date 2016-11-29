require 'carrierwave/orm/activerecord'

class ListingsController < ApplicationController


  def index
    @listing = Listing.paginate(page: params[:page]).order("id DESC")
  end

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.new(listing_params)
    listing.user_id = current_user.id
    listing.save!
    redirect_to listings_path
  end

  def update
    listing = Listing.find(params[:id])
    listing.update(listing_params)
    redirect_to listings_path
  end

  def show
    @listing = Listing.find(params[:id])

  end

  def edit
  @listing = Listing.find(params[:id])    
    if current_user.roles != "landlord" && current_user.roles != "admin"
     flash[:alert] = "Sorry, you are not allowed to perform this action."
     redirect_to :back
    end
  end

  def destroy
    if current_user.roles != "landlord" && current_user.roles != "admin"
      flash[:alert] = "Sorry, you are not allowed to perform this action."
      redirect_to :back
    else
      @listing = Listing.find(params[:id])
      @listing.destroy
      flash[:alert] = "Your listing has been removed. Thank you for you services!"
      redirect_to :back
    end
  end

  private
  def listing_params 
    params.require(:listing).permit(:city, :max_occupants, :address, :price, :availibitliy, :description, :number_of_bathrooms, :number_of_bedrooms, :image)
  end
end
