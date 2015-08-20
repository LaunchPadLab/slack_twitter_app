class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice] = "Signed In"
    create_twitter_client
    byebug
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed Out"
    redirect_to root_url
  end

  def create_twitter_client
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET_KEY']
      config.access_token = current_user.access_token
      config.access_token_secret = current_user.secret_access_token
    end
  end

end