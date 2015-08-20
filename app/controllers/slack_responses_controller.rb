class SlackResponsesController < ApplicationController

  def create
    puts params
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