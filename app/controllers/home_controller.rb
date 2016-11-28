class HomeController < ApplicationController
	
	def index 
		if current_user && current_user.profile.nil? 
			profile = Profile.new(user_id: current_user.id)   # when signed in, if current_user doesnt have a profile, we assign it a new stuff
			profile.save!
		end
	end 

end
