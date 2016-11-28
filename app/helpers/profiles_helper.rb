module ProfilesHelper
	def current_profile 
		profile = current_user.id
		profile = profile.to_i
		@current_profile = profile
	end
end
