class Api::PlayersController < ApplicationController
  def index
    @players = Player.all
    render 'index.json.jb'
  end

  def show
    @player = Player.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @player = Player.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      position: params[:position],
      nfl_team: params[:nfl_team],
      projected_points: params[:projected_points],
      weather_projected_points: params[:weather_projected_points], 
      total_projected_points: params[:total_projected_points]
    )
    @player.save
    render 'show.json.jb'
  end
end
