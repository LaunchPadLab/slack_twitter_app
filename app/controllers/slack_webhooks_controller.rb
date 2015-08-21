class SlackWebhooksController < ApplicationController

  def create
    if find_user.nil?
      render json: { text: "Sorry we couldn't find you. Double check that the team domain name on Slack matches." }
    else
      create_message
      create_twitter_client(@user)

      begin
        send_tweet(@twitter_client, @message)
        render json: { text: "Cha ching!" }
      rescue Twitter::Error => e
        render json: { text: "Sorry that didn't work: #{e.message}" }
      end
    end
  end

  def create_twitter_client(user)
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET_KEY']
      config.access_token = user.access_token
      config.access_token_secret = user.secret_access_token
    end
  end

  def find_user
    @user = User.find_by_team_domain(params[:team_domain])
  end

  def create_message
    @message = params[:text].split("#{params[:trigger_word]} ",2).second
  end

  def send_tweet(client, message)
    client.update(message)
  end

end