class ChangeColumnNamesToPlayerPostionsWithIds < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_teams, :player_name, :string
    remove_column :user_teams, :position, :string
    remove_column :user_teams, :player_nfl_team, :string
    remove_column :user_teams, :game_location, :string
    remove_column :user_teams, :opponent, :string
    remove_column :user_teams, :current_weather, :string
  end
end
