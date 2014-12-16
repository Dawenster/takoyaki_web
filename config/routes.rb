Rails.application.routes.draw do
  root "phrases#index"

  resources :phrases, :except => [:show]

  scope "/api" do
    get "game_details" => "apis#game_details", as: :game_details
    get "next_phrase" => "apis#next_phrase", as: :next_phrase
  end
end
