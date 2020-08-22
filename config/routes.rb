Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    get "/players" => "players#index"
    get "/players/:id" => "players#show"
    post "/players" => "players#create"
    patch "/players/:id" => "players#update"
    delete "players/:id" => "players#destroy"

    post "/users" => "users#create"

    get "/performances" => "performances#index"
    get "/performances/:id" => "performances#show"

  end
end
