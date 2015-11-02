class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.integer :year
      t.string :description
      t.string :poster
      t.string :trailer
      t.float :score
      t.string :country

      t.timestamps null: false
    end
  end
end
