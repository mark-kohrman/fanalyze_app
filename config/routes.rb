Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    get "/players" => "players#index"
    get "/players/:id" => "players#show"
    post "/players" => "players#create"
    patch "/players/:id" => "players#update"
    delete "/players/:id" => "players#destroy"

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/projections" => "projections#index"
    get "/projections/:id" => "projections#show"

    get "/temperatures" => "temperatures#index"
    get "/temperatures/:id" => "temperatures#show"

    get "/performances" => "performances#index"
    get "/performances/:id" => "performances#show"

    get "/user_teams" => "user_teams#index"
    get "/user_teams/:id" => "user_teams#show"
    post "/user_teams" => "user_teams#create"
    patch "/user_teams/:id" => "user_teams#update"
    delete "/user_teams/:id" => "user_teams#destroy"


  end
end
