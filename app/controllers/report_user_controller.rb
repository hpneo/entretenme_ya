class ReportUserController < ApplicationController

	def create
	
			@user_id = current_user.id
			@description = params[:description]
			@reason = params[:reason]
		  @user_to_report =params[:user_to_report]
		  @report_user = ReportUser.new(user_id: @user_id, description: @description, reason: @reason, user_to_report: @user_to_report)
			@report_user.save
			redirect_to '/contents'

		
	end

	def list
		@report_users = ReportUser.where(report_users_id: @report_users_id)
	end

end