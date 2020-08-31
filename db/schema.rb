# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_31_180302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "performances", force: :cascade do |t|
    t.string "player_name"
    t.string "position"
    t.string "nfl_team"
    t.integer "passing_yds"
    t.integer "passing_tds"
    t.integer "interceptions"
    t.integer "passing_attempts"
    t.integer "completions"
    t.integer "rushing_yds"
    t.integer "rushing_tds"
    t.integer "receptions"
    t.integer "targets"
    t.integer "rec_yds"
    t.integer "fumble_losses"
    t.integer "ppr_fantasy_points"
    t.integer "standard_fantasy_points"
    t.integer "half_ppr_fantasy_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rec_tds"
    t.integer "player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.string "position"
    t.string "nfl_team"
    t.integer "projected_points"
    t.integer "weather_projected_points"
    t.integer "total_projected_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.string "user_team_name"
    t.integer "player_projected_points"
    t.integer "weather_projected_points"
    t.integer "total_projected_points"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "qb_player_id"
    t.integer "rb1_player_id"
    t.integer "rb2_player_id"
    t.integer "wr1_player_id"
    t.integer "wr2_player_id"
    t.integer "flex_player_id"
    t.integer "te_player_id"
    t.integer "kicker_player_id"
    t.integer "dst_player_id"
    t.string "player_name"
    t.string "qb_player_name"
    t.string "rb1_player_name"
    t.string "rb2_player_name"
    t.string "wr1_player_name"
    t.string "wr2_player_name"
    t.string "te_player_name"
    t.string "flex_player_name"
    t.string "kicker_player_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "performances", "players"
end
