Rails.application.routes.draw do
  root to: "pokemons#index"

  resources :pokemons, only: %i[show] do
    resources :pokeballs, only: %i[new create]
  end

  resources :trainers, only: %i[index show]

  get "up" => "rails/health#show", as: :rails_health_check
end
