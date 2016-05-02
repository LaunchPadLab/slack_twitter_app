# slack_twitter_app

An app to send tweets from a Slack channel to Twitter.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/LaunchPadLab/slack_twitter_app/tree/heroku_deploy_test&env[TWITTER_KEY]=WbHZPLYeVWt25Qx1EF2VgPT91&env[TWITTER_SECRET_KEY]=7Y9abtUIvQ8NFtqI2pKDWJrd3eV2eiekkvbuU74URjGyHMBvcc&env[SLACK_TEAM_DOMAIN]=launchpadlab&env[SLACK_TOKEN]=oAMstvZYYarWG7IQkcNBjha1)

By [LaunchPad Lab](http://launchpadlab.com).

## Details

* Ruby 2.1.2
* Postgres

## Setup

1. Click the 'Deploy to Heroku' button.

### Slack
2. Create Slack Outgoing Webhook using the URL from the Heroku deploy.  

  `https://slack.com/apps/build > Build Your Own > Make a Custom Integration > Outgoing Webhooks`

  ![Slack screenshot](app/assets/images/slack1.png)

### Twitter
3. Create a new Twitter application using your account.
  `https://apps.twitter.com/ > Create New App`
* Use any name and description.
* Website: use the URL from the Heroku deploy.
* Callback URL: use the URL from the Heroku deploy + '/auth/twitter/callback/', e.g., 'https://immense-garden-20341.herokuapp.com/auth/twitter/callback'
* 
![Twitter screenshot](app/assets/images/twitter1.png)

5. Add your Twitter API Key and Secret Key as environment variables through Heroku.
6. Add your Slack team domain and token from the Outgoing Webhook your created as environment variables through Heroku.
7. Sign in to app (using Twitter OAuth).
8. Get to tweeting!
