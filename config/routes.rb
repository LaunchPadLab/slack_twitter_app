Rails.application.routes.draw do
  root 'static_pages#home'

  # USER ROUTES==============================================
  get "/auth/twitter", :as => :signin
  get '/auth/:provider/callback', to: 'sessions#create'
  get "/signout" => "sessions#destroy", :as => :signoutUser

  resources :slack_webhooks
  resources :users

  get "/sign_up_step_2" => "users#add_team_domain", :as => :add_team_domain

end
