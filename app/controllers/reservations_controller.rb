class ReservationsController < ApplicationController
	def index 
	end

	def new 
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end 

	def show 

	end

	def edit 
	end

	def destroy
	end 

	def create 
		reservation = Reservation.new(permission)
		reservation.listing_id = params[:listing_id]
		reservation.user_id = current_user.id
		reservation.payment_id = 1 # defaults the payment
		
		if reservation.valid_date? #true 
			reservation.save!
			redirect_to new_listing_reservation_basket_path(listing_id: reservation.listing_id, reservation_id: reservation.id)
		else 
			flash[:alert] = "Sorry, the thing is fully booked"
			@reservation = Reservation.new
			redirect_to :back	
		end			
	end 

	private
	def permission 
			params.require(:reservation).permit(:check_in, :check_out)
	end
	
end
