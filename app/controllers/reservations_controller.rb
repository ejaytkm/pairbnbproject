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
		byebug
		
		if reservation.valid_date? #true 
			reservation.save!
			redirect_to basket_path(reservation_id: reservation.id, user_id: reservation.user_id, check_in: reservation.check_in, check_out: reservation.check_out, price: reservation.price)
		else 
			flash[:alert] = "Sorry, the thing is fully booked"
			@reservation = Reservation.new
			redirect_to :back	
		
		end			
	end 


	def basket #get 
		@client_token = Braintree::ClientToken.generate
		@paymeent = Payment.new
		session[:reservation_id] = params[:reservation_id]
	end

	def checkout #post
		nounce = params[:payment_method_nounce]
		result = Braintree::Transaction.sale(
		  :amount => "10.00",
		  :payment_method_nonce => nounce,
		  :options => {
	    :submit_for_settlement => true
  	})

		payment = Payment.new
		payment.transaction_id = result.transaction.id
		payment.amount = result.transaction.amount
		payment.last_four_digit = result.transaction.credit_card_details.last_4
		payment.card_type = result.transaction.credit_card_details.card_type
		payment.save!
		
		reservation = Reservation.find_by_id(params[:reservation_id])
		reservation.payment_id = payment.id
		reservation.save!
	end


	private
	def permission 
			params.require(:reservation).permit(:check_in, :check_out)
	end
	
end
