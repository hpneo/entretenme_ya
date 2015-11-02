class CreatePendings < ActiveRecord::Migration
  def change
    create_table :pendings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :content, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
