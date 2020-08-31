class AddPositionSpecificPlayerNamesToUserTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :user_teams, :qb_player_name, :string
    add_column :user_teams, :rb1_player_name, :string
    add_column :user_teams, :rb2_player_name, :string
    add_column :user_teams, :wr1_player_name, :string
    add_column :user_teams, :wr2_player_name, :string
    add_column :user_teams, :te_player_name, :string
    add_column :user_teams, :flex_player_name, :string
    add_column :user_teams, :kicker_player_name, :string
  end
end
