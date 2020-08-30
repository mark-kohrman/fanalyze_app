class Api::UserTeamsController < ApplicationController
  def index
    @user_teams = UserTeam.all
    render 'index.json.jb'
  end

  def show
    @user_team = UserTeam.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
      @user_team = UserTeam.create!(
      user_team_name: params[:user_team_name],
      user_id: params[:user_id],
      )
 
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
