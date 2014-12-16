Rails.application.routes.draw do
  resources :phrases

  scope "/api" do
    get "game_details" => "apis#game_details", as: :game_details
    get "new_phrase" => "apis#new_phrase", as: :new_phrase
  end
end
