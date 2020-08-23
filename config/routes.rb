Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    get "/players" => "players#index"
    get "/players/:id" => "players#show"

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"


    get "/performances" => "performances#index"
    get "/performances/:id" => "performances#show"

    get "/user_teams" => "user_teams#index"


  end
end
