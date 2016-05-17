# slack_twitter_app

[![Code Climate](https://codeclimate.com/repos/5727c3e0b7eacc22740059a0/badges/c6e5cf6f1cce6491948d/gpa.svg)](https://codeclimate.com/repos/5727c3e0b7eacc22740059a0/feed)

An app to send tweets from a Slack channel to Twitter.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/LaunchPadLab/slack_twitter_app/tree/dev)

By [LaunchPad Lab](http://launchpadlab.com).

***

## Details

* Ruby 2.1.2
* Memcachier

***

## Setup

1. Click the 'Deploy to Heroku' button.

  ### Create Slack Outgoing Webhook

2. Create Slack Outgoing Webhook using the URL from the Heroku deploy **adding the endpoint** `/slack_webhooks`. Make sure to also select an appropriate trigger word.

  `https://slack.com/apps/build > Build Your Own > Make a Custom Integration > Outgoing Webhooks`

    ![Slack screenshot](app/assets/images/slack1.png)
    ![Slack screenshot](app/assets/images/slack3.png)

  ***

  ### Create New Twitter Application

3. Create a new Twitter application using your account.

  `https://apps.twitter.com/ > Create New App`

    * Use any name and description.
    * Website: use the URL from the Heroku deploy.
    * Callback URL: use the URL from the Heroku deploy + '/auth/twitter/callback/', e.g.,

    `https://YOURAPPNAME.herokuapp.com/auth/twitter/callback`

    ![Twitter screenshot](app/assets/images/twitter1.png)

  ***

  ### Heroku

4. Add your Twitter API Key and Secret Key as environment variables through the Heroku web UI or command line interface:

  ~~~~
  $ heroku config:set TWITTER_KEY=...

  $ heroku config:set TWITTER_SECRET_KEY=...
  ~~~~

    ![Twitter screenshot](app/assets/images/twitter2.png)


5. Add your Slack team domain and token from the Outgoing Webhook you created as Heroku environment variables.

  ~~~~
  $ heroku config:set SLACK_TEAM_DOMAIN=...

  $ heroku config:set SLACK_TOKEN=...
  ~~~~

    ![Slack screenshot](app/assets/images/slack2.png)

  ### Final Steps

6. Visit your freshly deployed Heroku app and sign in (uses Twitter OAuth).
7. Get to tweeting using your Slack channel!
