class Api::UserTeamsController < ApplicationController
  def index
    @user_teams = UserTeam.all
    render 'index.json.jb'
  end
end
