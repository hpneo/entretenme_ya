class CommentController < ApplicationController

	def new
		@content_id = params[:content_id]
	end

	def create
		@content_id = params[:content_id]
		if current_user
			@user_id = current_user.id
			@body = params[:body]
			@comment = Comment.new(content_id: @content_id, user_id: @user_id, body: @body)
			@comment.save
			@link = '/contents/' + @content_id
			redirect_to @link

		else
			redirect_to '/home'
		end
	end

	def list
		@content_id = params[:content]
		@comments = Comment.where(content_id: @content_id)

	end

end
