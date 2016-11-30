class Reservation < ApplicationRecord
	 belongs_to :listing
	 belongs_to :user
	 belongs_to :payment 
	 
	def range 
		(self.check_in...self.check_out).to_a
	end

	def valid_date?
		a = []
			self.listing.reservations.each do |reservation| 
				a << reservation.range
			end
		return ( self.range & a.flatten ).empty? ?  true : false
	end

end
