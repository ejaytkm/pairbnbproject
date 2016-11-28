class ProfilesController < ApplicationController
	def index 
	end 

	def new 
		@profile = Profile.new
	end 

	def edit
		@profile = Profile.find(params[:id])
	end

	def show 
	end


end
