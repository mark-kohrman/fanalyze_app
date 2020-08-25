# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require 'csv'

# SEED_FORMAT = /(?<year>\d{4})week(?<week>\d+).csv/

# Dir[Rails.root.join("lib","seeds", "*.csv")].each do |filepath|
#   next unless match = filepath.match(SEED_FORMAT)
#   puts "Importing seeds for #{match[:year]} week #{match[:week]}"
#   csv_text = File.read(filepath)
#   csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
#   csv.each do |row|
#     @player = Player.where({
#                        player_name: row['Player'],
#                        position: row['Pos'],
#                        # uncomment this next line if you want to create a new record when
#                        # a player switches team....
#                        # nfl_team: row['Tm'],
#                     }).first_or_create({
#                       player_name: row['Player'],
#                       position: row['Pos'],                    })
#     t = @player.performances.create!({
#       player_name: row['Player'],
#       position: row['Pos'],
#       nfl_team: row['Tm'],
#       passing_yds: row['PassingYds'],
#       passing_tds: row['PassingTD'],
#       interceptions: row['Int'],
#       passing_attempts: row['PassingAtt'],
#       completions: row['Cmp'],
#       rushing_yds: row['RushingYds'],
#       rushing_tds: row['RushingTD'],
#       receptions: row['Rec'],
#       targets: row['Tgt'],
#       rec_yds: row['ReceivingYds'],
#       rec_tds: row['ReceivingTD'],
#       fumble_losses: row['FL'],
#       ppr_fantasy_points: row['PPRFantasyPoints'],
#       standard_fantasy_points: row['StandardFantasyPoints'],
#       half_ppr_fantasy_points: row['HalfPPRFantasyPoints'],
#     })
#     puts "#{t.player_name}, had #{t.passing_yds} passing yards"
#   end
# end





