class ProfileController < ApplicationController
	def show
		@user = User.find(params["id"])
	end

  def current_show
    @user = current_user

    render "show"
  end

  def suggested_users
    data = User.all.inject({}) do |hash, user|
      hash[user.email] = Rate.where(rater_id: user.id).inject({}) do |rate_hash, rate|
        rate_hash[rate.rateable_id] = rate.stars
        rate_hash
      end

      hash
    end

    suggestor = Suggestor::Suggestor.new(data)
    similar_users = suggestor.similar_to(current_user.email)
    similar_users_ids = similar_users.map { |item| item.first }

    @users = User.where(email: similar_users_ids)
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
