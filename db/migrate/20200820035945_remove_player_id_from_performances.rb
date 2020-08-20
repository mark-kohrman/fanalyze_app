class RemovePlayerIdFromPerformances < ActiveRecord::Migration[6.0]
  def change
    remove_column :performances, :player_id, :integer
  end
end
