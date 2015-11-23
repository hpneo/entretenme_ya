class CreateReportUsers < ActiveRecord::Migration
  def change
    create_table :report_users do |t|
 
    t.references :user, index: true, foreign_key: true
 	  t.string :reason
 	  t.text :description
    t.string :user_to_report
    t.timestamps null: false
    end
  end
end
