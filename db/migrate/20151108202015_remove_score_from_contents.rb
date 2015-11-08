class RemoveScoreFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :score
  end
end
