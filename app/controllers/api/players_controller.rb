class Api::PlayersController < ApplicationController
  def index
    render 'index.json.jb'
  end
end
