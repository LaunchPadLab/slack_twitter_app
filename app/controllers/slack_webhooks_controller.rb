class SlackWebhooksController < ApplicationController

  def create
    if !check_slack_account
      render json: { text: "Sorry we couldn't find you. Double check that the team domain name on Slack matches." }
    else
      create_message

      begin
        create_twitter_client(@user)
        send_tweet(@twitter_client, @message)
        render json: { text: "Cha ching!" }
      rescue Twitter::Error => e
        render json: { text: "Sorry that didn't work: #{e.message}" }
      rescue ArgumentError => e
        render json: { text: "Twitter login credentials have expired. Please re-authenticate." }
      end
    end
  end

  private
    def create_twitter_client(user)
      access_token = Rails.cache.read('access_token')
      secret_access_token = Rails.cache.read('secret_access_token')
      if access_token.nil? || secret_access_token.nil?
        raise ArgumentError
      end
      @twitter_client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET_KEY']
        config.access_token = access_token
        config.access_token_secret = secret_access_token
      end
    end

    def check_slack_account
      return ENV['SLACK_TEAM_DOMAIN'] == params[:team_domain] && ENV['SLACK_TOKEN'] == params[:token]
    end

    def create_message
      @message = params[:text].split("#{params[:trigger_word]} ",2).second
    end

    def send_tweet(client, message)
      client.update(message)
    end
end
