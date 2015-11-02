class ProfileController < ApplicationController
	def show
		@user = User.find(params["id"])
	end

	def edit
		@user = User.find(params["id"])
	end

	def update
		@id = params[:id]
		@email = params[:email]
		@user = User.find(@id)
		@user.email = @email;
		@user.save
		redirect_to "/profile/show/#{@id}"
	end
end
