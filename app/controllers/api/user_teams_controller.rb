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
    )
    @user_team.save!
    render 'show.json.jb'
  end 
end
