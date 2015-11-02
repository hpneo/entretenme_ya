class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.references :content, index: true, foreign_key: true
 	  t.references :user, index: true, foreign_key: true
 	  t.text :body
 	  t.float :score

      t.timestamps null: false
    end
  end
end
