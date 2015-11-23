ActiveAdmin.register ReportUser do
    index do
        column :user
        column :user_to_report
        column :reason
        column :description
    end
end
