class RenamePositionColumnForPlayers < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :postion, :position
  end
end
