class ReviewController < ApplicationController

	def new
		@content_id = params[:content_id]
	end

	def create
		@content_id = params[:content_id]
		if current_user
			@user_id = current_user.id
			@body = params[:body]
			@score = params[:score]
			@review = Review.new(content_id: @content_id, user_id: @user_id, body: @body, score: @score)
			@review.save
			redirect_to '/media/show'
		else
			redirect_to '/home'
		end
	end

end
