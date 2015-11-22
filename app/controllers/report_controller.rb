class ReportController < ApplicationController
  
	def create
	
			@user_id = current_user.id
			@description = params[:description]
			@reason = params[:reason]
			@reports_type = params[:reports_type]
			@report = Report.new(report_id: @report_id, user_id: @user_id, description: @description, reason: @reason, reports_type: @reports_type)
			@report.save

		
	end

	def list
		@reports = Report.where(report_id: @report_id)
	end

end
