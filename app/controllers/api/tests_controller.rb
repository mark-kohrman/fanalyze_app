class Api::TestsController < ApplicationController
  def index

    p "*" * 88
    p current_user
    p "*" * 88

    @user_teams = UserTeam.all

    if current_user
      @user_teams = UserTeam.order(:id => :desc)
    else
      @user_teams = []
    end

    render 'index.json.jb'

  end

  def show
    @user_team = UserTeam.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create

    response = HTTP.get("https://api.sportsdata.io/v3/nfl/projections/json/PlayerGameProjectionStatsByWeek/2020/1?key=")
    @test = response.parse
    p @test
    # test_qb = @test.find_by(player_name: params[:qb_player_id]).id
    # test_rb1= @test.find_by(player_name: params[:rb1_player_id]).id
    # test_rb2 = @re.find_by(player_name: params[:rb2_player_id]).id
    # test_wr1 = Player.find_by(player_name: params[:wr1_player_id]).id
    # test_wr2 = Player.find_by(player_name: params[:wr2_player_id]).id
    # test_flex = Player.find_by(player_name: params[:flex_player_id]).id
    # test_te = Player.find_by(player_name: params[:te_player_id]).id
    # test_kicker = Player.find_by(player_name: params[:kicker_player_id]).id

    @test= Test.new(
      user_team_name: params[:user_team_name],
      qb_player_id: qb_id,
      rb1_player_id: rb1_id,
      rb2_player_id: rb2_id,
      wr1_player_id: wr1_id,
      wr2_player_id: wr2_id,
      flex_player_id: flex_id,
      te_player_id: te_id,
      kicker_player_id: kicker_id,
      user_id: current_user.id
      )
    @user_team.save!
    p @user_team
    
 
    render 'show.json.jb'
  end

  def update
    p "$" * 88
    p current_user
    qb_id = Player.find_by(player_name: params[:qb_player_id]) && Player.find_by(player_name: params[:qb_player_id]).id
    rb1_id = Player.find_by(player_name: params[:rb1_player_id]) && Player.find_by(player_name: params[:rb1_player_id]).id
    rb2_id = Player.find_by(player_name: params[:rb2_player_id]) && Player.find_by(player_name: params[:rb2_player_id]).id
    wr1_id = Player.find_by(player_name: params[:wr1_player_id]) && Player.find_by(player_name: params[:wr1_player_id]).id
    wr2_id = Player.find_by(player_name: params[:wr2_player_id]) && Player.find_by(player_name: params[:wr2_player_id]).id
    flex_id = Player.find_by(player_name: params[:flex_player_id]) && Player.find_by(player_name: params[:flex_player_id]).id
    te_id = Player.find_by(player_name: params[:te_player_id]) && Player.find_by(player_name: params[:te_player_id]).id
    kicker_id = Player.find_by(player_name: params[:kicker_player_id]) && Player.find_by(player_name: params[:kicker_player_id]).id
    p qb_id
    p rb1_id
    @user_team = UserTeam.find_by(id: params[:id])
    @user_team.update(
      user_team_name: params[:user_team_name] || @user_team.user_team_name,   
      qb_player_id: qb_id || @user_team.qb_player_id,
      rb1_player_id: rb1_id || @user_team.rb1_player_id,
      rb2_player_id: rb2_id || @user_team.rb2_player_id,
      wr1_player_id: wr1_id|| @user_team.wr1_player_id,
      wr2_player_id: wr2_id || @user_team.wr2_player_id,
      flex_player_id: flex_id || @user_team.flex_player_id,
      te_player_id: te_id|| @user_team.te_player_id,
      kicker_player_id: kicker_id || @user_team.kicker_player_id,
      user_id: current_user.id

    )
    @user_team.save!
    render 'show.json.jb'
  end

  def destroy
    @user_team = UserTeam.find_by(id: params[:id])
    @user_team.destroy
    render json: {message: "You have successfully deleted your team!"}
  end
end
