class PendingController < ApplicationController

	def create
		@content_id = params[:content_id]
		if current_user
			@user_id  = current_user.id
			@pending = Pending.where(user_id: @user_id, content_id: @content_id)
			if @pending.blank?
				@pending = Pending.new(user_id: @user_id, content_id: @content_id)
				@pending.save
			end
			redirect_to '/contents/' + @content_id
		else
			redirect_to '/home'
		end
	end

end
