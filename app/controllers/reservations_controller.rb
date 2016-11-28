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
		reservation.save!
			if reservation.save!
				flash[:alert] = "You have booked your reservation. Please check your email"
			else 
				flash[:alert] = "Sorry, there was an error. Please try again later or contact the PairBNB team"
			end
	end

	def show
	end

	private
	def permission 
			params.require(:reservation).permit(:check_in, :check_out, :listing_id)
	end
	
end
