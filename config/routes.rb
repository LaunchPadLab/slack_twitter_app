Rails.application.routes.draw do
  root 'static_pages#home'

  # USER ROUTES==========================================
  get "/auth/twitter", :as => :signin
  get '/auth/:provider/callback', to: 'cache#create'

  # SLACK WEBHOOK=========================================
  post "/slack_webhooks" => "slack_webhooks#create"

  resources :users, only: [:edit, :create]
end
