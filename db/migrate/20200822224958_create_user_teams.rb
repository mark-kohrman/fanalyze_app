class CreateUserTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :user_teams do |t|
      t.string :user_team_name
      t.string :player_name
      t.string :position
      t.string :player_nfl_team
      t.string :game_location
      t.string :opponent
      t.string :current_weather
      t.integer :player_projected_points
      t.integer :weather_projected_points
      t.integer :total_projected_points
      t.integer :user_id
      t.integer :player_id

      t.timestamps
    end
  end
end
