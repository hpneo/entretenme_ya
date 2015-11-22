class ProfileController < ApplicationController
	def show
		@user = User.find(params["id"])
	end

  def current_show
    @user = current_user

    render "show"
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

  def contents
    @contents = Rate.where(rater_id: user.id).map(&:rateable)
  end
end
