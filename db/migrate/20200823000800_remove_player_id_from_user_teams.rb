class RemovePlayerIdFromUserTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_teams, :player_id, :integer
  end
end
