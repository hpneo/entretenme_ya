class FavoriteController < ApplicationController

	def create
		@content_id = params[:content_id]
		if current_user
			@user_id  = current_user.id
			@favorite = Favorite.where(user_id: @user_id, content_id: @content_id)
			if @favorite.blank?
				@favorite = Favorite.new(user_id: @user_id, content_id: @content_id)
				@favorite.save					
			end
			redirect_to '/media/show'
		else
			redirect_to '/home'
		end
	end
	
end
