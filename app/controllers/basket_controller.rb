class BasketController < ApplicationController

	def new 
		@listing_id = params[:listing_id]
		@reservation_id = params[:reservation_id]
		@client_token = Braintree::ClientToken.generate
		@paymeent = Payment.new
	end

	def create
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
		
		flash[:alert] = "Your payment went through succesfully!"
		redirect_to home_path
		
	end

end
