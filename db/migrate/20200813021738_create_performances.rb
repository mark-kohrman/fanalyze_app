class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.string :player_name
      t.string :position
      t.string :nfl_team
      t.integer :passing_yds
      t.integer :passing_tds
      t.integer :interceptions
      t.integer :passing_attempts
      t.integer :completions
      t.integer :rushing_yds
      t.integer :rushing_tds
      t.integer :receptions
      t.integer :targets
      t.integer :rec_yds
      t.integer :fumble_losses
      t.integer :ppr_fantasy_points
      t.integer :standard_fantasy_points
      t.integer :half_ppr_fantasy_points

      t.timestamps
    end
  end
end
