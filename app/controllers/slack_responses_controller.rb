class SlackResponsesController < ApplicationController

  def create
    find_user(params)
    create_twitter_client(@user)
    @twitter_client.update("So excited to have started at @launchpadlab this week. Learning so much already!")
  end

  def create_twitter_client(user)
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET_KEY']
      config.access_token = user.access_token
      config.access_token_secret = user.secret_access_token
    end
  end

  def find_user(params)
    @user = User.find_by_team_domain(params[:team_domain])
  end

end