class UsersController < ApplicationController
	before_action: require_login 

	def index 
		current_user.users
	end 

end
