class AddRemoteIdToContents < ActiveRecord::Migration
  def change
    add_column :contents, :remote_id, :integer
  end
end
