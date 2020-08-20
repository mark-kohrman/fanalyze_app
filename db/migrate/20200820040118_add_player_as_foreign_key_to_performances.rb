class AddPlayerAsForeignKeyToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :performances, :player_id, :integer
  end
end
