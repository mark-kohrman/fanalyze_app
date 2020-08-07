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

  def update
    @player = Player.find_by(id: params[:id])
    @player.update(
      first_name: params[:first_name] || @player.first_name,
      last_name: params[:last_name] || @player.last_name,
      position: params[:position] || @player.position,
      nfl_team: params[:nfl_team] || @player.nfl_team,
      projected_points: params[:projected_points] || @player.projected_points,
      weather_projected_points: params[:weather_projected_points] || @player.weather_projected_points, 
      total_projected_points: params[:total_projected_points] || @player.total_projected_points
    )
    @player.save
    render 'show.json.jb'
  end

  def destroy
    @player = Player.find_by(id: params[:id])
    @player.destroy

    render json: {message: "The player has been deleted successfully."}
  end
end
