class DeleteLastNameFromPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :last_name, :string
  end
end
