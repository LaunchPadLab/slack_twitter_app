Rails.application.routes.draw do
  root 'static_pages#home'

  # USER ROUTES==============================================
  get "/auth/twitter", :as => :signin
  get '/auth/:provider/callback', to: 'sessions#create'
  get "/signout" => "sessions#destroy", :as => :signoutUser

  post '/tweet_from_slack', to: 'slack_responses#new'
  resources :slack_responses

end
