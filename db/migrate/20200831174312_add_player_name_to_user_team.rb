class AddPlayerNameToUserTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :user_teams, :player_name, :string
  end
end
