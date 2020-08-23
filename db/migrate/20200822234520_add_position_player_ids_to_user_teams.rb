class AddPositionPlayerIdsToUserTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :user_teams, :qb_player_id, :integer
    add_column :user_teams, :rb1_player_id, :integer
    add_column :user_teams, :rb2_player_id, :integer
    add_column :user_teams, :wr1_player_id, :integer
    add_column :user_teams, :wr2_player_id, :integer
    add_column :user_teams, :flex_player_id, :integer
    add_column :user_teams, :te_player_id, :integer
    add_column :user_teams, :kicker_player_id, :integer
    add_column :user_teams, :dst_player_id, :integer
  end
end
