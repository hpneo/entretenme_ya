class ChangeTrailerInContents < ActiveRecord::Migration
  def change
    remove_column :contents, :trailer
    add_column :contents, :trailer_id, :string
  end
end
