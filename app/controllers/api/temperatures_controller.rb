class Api::TemperaturesController < ApplicationController
  def index
    response = HTTP.get("https://api.sportsdata.io/v3/nfl/projections/json/PlayerGameProjectionStatsByWeek/2020/1?key=")
    @projections = response.parse
    @projections.each do |projection|
      #adding if statement to see where player is playing so it is known which city the game is being played in.
      if projection["HomeOrAway"] == "HOME"
        @stadium_city_abbreviation = projection["Team"]
      else
        @stadium_city_abbreviation = projection["Opponent"]
      end
      player_name = projection["Name"]
      #setting each team abbreviation (where game is being played) equal to city so the weather API can look it up.

      if @stadium_city_abbreviation == "BAL"
        @stadium_city = "baltimore"
      elsif @stadium_city_abbreviation == "KC"
        @stadium_city = "kansas city"
      elsif @stadium_city_abbreviation == "SEA"
        @stadium_city = "seattle"
      elsif @stadium_city_abbreviation == "CAR"
        @stadium_city = "charlotte"
      elsif @stadium_city_abbreviation == "BUF"
        @stadium_city = "orchard park"
      elsif @stadium_city_abbreviation == "DEN"
        @stadium_city = "denver"
      elsif @stadium_city_abbreviation == "WAS"
        @stadium_city = "landover"
      elsif @stadium_city_abbreviation == "CLE"
        @stadium_city = "cleveland"
      elsif @stadium_city_abbreviation == "NE"
        @stadium_city = "foxborough"
      elsif @stadium_city_abbreviation == "MIA"
        @stadium_city = "miami gardens"
      elsif @stadium_city_abbreviation == "PIT"
        @stadium_city = "pittsburgh"
      elsif @stadium_city_abbreviation == "GB"
        @stadium_city = "green bay"
      elsif @stadium_city_abbreviation == "SF"
        @stadium_city = "santa clara"
      elsif @stadium_city_abbreviation == "PHI"
        @stadium_city = "philadelphia"
      elsif @stadium_city_abbreviation == "NYG" || @stadium_city_abbreviation == "NYJ"
        @stadium_city = "east rutherford"
      elsif @stadium_city_abbreviation == "TEN"
        @stadium_city = "nashville"
      elsif @stadium_city_abbreviation == "CIN"
        @stadium_city = "cincinnati"
      elsif @stadium_city_abbreviation == "TB"
        @stadium_city = "tampa"
      elsif @stadium_city_abbreviation == "CHI"
        @stadium_city = "chicago"
      elsif @stadium_city_abbreviation == "JAX"
        @stadium_city = "jacksonville"
      else
        @stadium_city = "dome"
      end

      # If the game is being played in a dome, no calculations need to be done.  Weather is a non-factor
      if @stadium_city == "dome"
        p "Don't worry about the weather, #{player_name} is in a dome"
        weather_projected_points = 0
      else
        #API set to city the game is being played in. 
        response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{@stadium_city}&units=imperial&appid=")
        @city_name = response.parse["name"]
        @temperature = response.parse["main"]["temp"]
        @current_weather_desc = response.parse["weather"][0]["main"]
        #Different projections based on the weather
        if @temperature > 70 && @temperature < 80 && @current_weather_desc == "Clear"
          weather_projected_points = 1
        elsif @current_weather_desc == "Rain" || @current_weather_desc == "Snow" || @current_weather_desc == "Thunderstorm" || @temperature < 32
          weather_projected_points = - 2
        elsif @temperature < 40
          weather_projected_points = -1
        else
          weather_projected_points = 0
        end

        p "It is currently #{@temperature} degrees and #{@current_weather_desc} in #{@city_name} where #{player_name} is playing.  The player should have #{weather_projected_points} point(s) due to the weather"
      
      end
    end
    # get current weather description related to each player displayed on index or show
    # get projected points based on the weather to index or show
    #get both working in Vue front end
    render "index.json.jb"

  end
  
  def show
    id = params[:id]
    p id
    response = HTTP.get("https://api.sportsdata.io/v3/nfl/projections/json/PlayerGameProjectionStatsByPlayerID/2020/1/#{id}?key=")
    @projection = response.parse
    @projection
    player_name = @projection["Name"]

    if @projection["HomeOrAway"] == "HOME"
      @stadium_city_abbreviation = @projection["Team"]
    else
      @stadium_city_abbreviation = @projection["Opponent"]
    end

    if @stadium_city_abbreviation == "BAL"
      @stadium_city = "baltimore"
    elsif @stadium_city_abbreviation == "KC"
      @stadium_city = "kansas city"
    elsif @stadium_city_abbreviation == "SEA"
      @stadium_city = "seattle"
    elsif @stadium_city_abbreviation == "CAR"
      @stadium_city = "charlotte"
    elsif @stadium_city_abbreviation == "BUF"
      @stadium_city = "orchard park"
    elsif @stadium_city_abbreviation == "DEN"
      @stadium_city = "denver"
    elsif @stadium_city_abbreviation == "WAS"
      @stadium_city = "landover"
    elsif @stadium_city_abbreviation == "CLE"
      @stadium_city = "cleveland"
    elsif @stadium_city_abbreviation == "NE"
      @stadium_city = "foxborough"
    elsif @stadium_city_abbreviation == "MIA"
      @stadium_city = "miami gardens"
    elsif @stadium_city_abbreviation == "PIT"
      @stadium_city = "pittsburgh"
    elsif @stadium_city_abbreviation == "GB"
      @stadium_city = "green bay"
    elsif @stadium_city_abbreviation == "SF"
      @stadium_city = "santa clara"
    elsif @stadium_city_abbreviation == "PHI"
      @stadium_city = "philadelphia"
    elsif @stadium_city_abbreviation == "NYG" || @stadium_city_abbreviation == "NYJ"
      @stadium_city = "east rutherford"
    elsif @stadium_city_abbreviation == "TEN"
      @stadium_city = "nashville"
    elsif @stadium_city_abbreviation == "CIN"
      @stadium_city = "cincinnati"
    elsif @stadium_city_abbreviation == "TB"
      @stadium_city = "tampa"
    elsif @stadium_city_abbreviation == "CHI"
      @stadium_city = "chicago"
    elsif @stadium_city_abbreviation == "JAX"
      @stadium_city = "jacksonville"
    else
      @stadium_city = "dome"
    end

    if @stadium_city == "dome"
      p "Don't worry about the weather, #{player_name} is in a dome"
      @weather_projected_points = 0
    else
      #API set to city the game is being played in. 
      response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{@stadium_city}&units=imperial&appid=")
      @city_name = response.parse["name"]
      @temperature = response.parse["main"]["temp"]
      @current_weather_desc = response.parse["weather"][0]["main"]
      #Different projections based on the weather
      if @temperature > 60 && @temperature < 80 && @current_weather_desc == "Clear"
        @weather_projected_points = 1
      elsif @current_weather_desc == "Rain" || @current_weather_desc == "Snow" || @current_weather_desc == "Thunderstorm" || @temperature < 32
        @weather_projected_points = - 2
      elsif @temperature < 40
        @weather_projected_points = -1
      else
        @weather_projected_points = 0
      end

      p "It is currently #{@temperature} degrees and #{@current_weather_desc} in #{@city_name} where #{player_name} is playing.  The player should have #{@weather_projected_points} point(s) due to the weather"
    
    end
    @total_projection = @projection["FantasyPoints"] + @weather_projected_points
    p @stadium_city
    
    render 'show.json.jb'
  end

end
