class SlackResponsesController < ApplicationController

  def create
    find_user(params)
    create_message(params)
    create_twitter_client(@user)

    begin
      send_tweet(@twitter_client, @message)
    rescue Twitter::Error => e
      render json: { text: "Sorry that didn't work: #{e.message}" }
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

  def create_message(params)
    @message = params[:text].split("#{params[:trigger_word]} ",2).second
  end

  def send_tweet(client, message)
    client.update(message)
  end

  private

  def responder
    @responder ||= Slack::Responder.new(params[:text])
  end


end