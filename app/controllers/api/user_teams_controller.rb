class Api::UserTeamsController < ApplicationController
  def index

    p "*" * 88
    p current_user
    p "*" * 88

    # @user_teams = UserTeam.all

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
    @qb_player_name = Player.find_by(player_name: params[:player_name])
    @user_team = UserTeam.new(
      user_team_name: params[:user_team_name],
      user_id: params[:user_id],
      qb_player_id: @qb_player_name,
      rb1_player_id: params[:rb1_player_id],
      rb2_player_id: params[:rb2_player_id],
      wr1_player_id: params[:wr1_player_id],
      wr2_player_id: params[:wr2_player_id],
      flex_player_id: params[:flex_player_id],
      te_player_id: params[:te_player_id],
      kicker_player_id: params[:kicker_player_id],
      dst_player_id: params[:dst_player_id]
      )
    p @user_team
    p "&" * 44
    p @qb_player_name
 
    render 'show.json.jb'
  end

  def update
    @user_team = UserTeam.find_by(id: params[:id])
    @user_team.update(
      user_team_name: params[:user_team_name] || @user_team.user_team_name,   
      user_id: params[:user_id] || @user_team.user_id,
      qb_player_id: params[:qb_player_id] || @user_team.qb_player_id,
      rb1_player_id: params[:rb1_player_id] || @user_team.rb1_player_id,
      rb2_player_id: params[:rb2_player_id] || @user_team.rb2_player_id,
      wr1_player_id: params[:wr1_player_id] || @user_team.wr1_player_id,
      wr2_player_id: params[:wr2_player_id] || @user_team.wr2_player_id,
      flex_player_id: params[:flex_player_id] || @user_team.flex_player_id,
      te_player_id: params[:te_player_id] || @user_team.te_player_id,
      kicker_player_id: params[:kicker_player_id] || @user_team.kicker_player_id
    )
    @user_team.save!
    render 'show.json.jb'
  end 
end
