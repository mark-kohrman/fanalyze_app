class DeletePlayerNameColumnsFromUserTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_teams, :qb_player_name, :string
    remove_column :user_teams, :rb1_player_name, :string
    remove_column :user_teams, :rb2_player_name, :string
    remove_column :user_teams, :wr1_player_name, :string
    remove_column :user_teams, :wr2_player_name, :string
    remove_column :user_teams, :te_player_name, :string
    remove_column :user_teams, :flex_player_name, :string
    remove_column :user_teams, :kicker_player_name, :string
    remove_column :user_teams, :player_name, :string
  end
end
