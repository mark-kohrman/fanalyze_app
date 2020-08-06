class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :postion
      t.string :nfl_team
      t.integer :projected_points
      t.integer :weather_projected_points
      t.integer :total_projected_points

      t.timestamps
    end
  end
end
