class RenamePlayerFirstNameToPlayerName < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :first_name, :player_name
  end
end
