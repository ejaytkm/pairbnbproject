module ListingsHelper
	def bool_to_icon(bool)
		bool ? "✓" : "☓"
	end

	def current_lister 
		@current_lister = Listing.find(params[:id])
	end
end
