class ReservationsController < ApplicationController
	def index 
	end

	def new 
		
		@reservation = Reservation.new
		@listing = params[:listing_id]
	end 

	def show 
	end

	def edit 
	end

	def destroy
	end

	def create 
		reservation = Reservation.new(permission)
		reservation.user_id = current_user.id 
		# reservation.save!
			# if reservation.save!
			redirect_to basket_path(reservation_id: reservation.user_id)
				# redirect_to basket_path
				# <%= link_to "Book Now", new_reservation_path(listing_id: @listing.id) %>
			# else 
			# 	flash[:alert] = "Sorry, there was an error. Please try again later or contact the PairBNB team"
			# end
	end

	def basket
		@client_token = Braintree::ClientToken.generate
	end

	def checkout
		nounce = params[:payment_method_nounce]
		result = Braintree::Transaction.sale(
	  :amount => "10.00",
	  :payment_method_nonce => nounce,
	  :options => {
    :submit_for_settlement => true
  })
		

	end


	private
	def permission 
			params.require(:reservation).permit(:check_in, :check_out, :listing_id)
	end
	
end
