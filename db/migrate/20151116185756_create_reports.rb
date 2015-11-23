class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    
    t.references :user, index: true, foreign_key: true
 	  t.string :reason
 	  t.text :description
    t.string :reports_type 
    t.timestamps null: false
    end
  end
end
