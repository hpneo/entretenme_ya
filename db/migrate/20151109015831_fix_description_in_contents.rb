class FixDescriptionInContents < ActiveRecord::Migration
  def change
    remove_column :contents, :description
    add_column :contents, :description, :text
  end
end
