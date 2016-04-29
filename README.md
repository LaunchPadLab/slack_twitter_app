# slack_twitter_app

An app to send tweets from a Slack channel to Twitter.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/LaunchPadLab/slack_twitter_app/tree/heroku_deploy_test&env[TWITTER_KEY]=WbHZPLYeVWt25Qx1EF2VgPT91&env[TWITTER_SECRET_KEY]=7Y9abtUIvQ8NFtqI2pKDWJrd3eV2eiekkvbuU74URjGyHMBvcc&env[SLACK_TEAM_DOMAIN]=launchpadlab&env[SLACK_TOKEN]=oAMstvZYYarWG7IQkcNBjha1)

By [LaunchPad Lab](http://launchpadlab.com).

## Setup

1. Click Deploy to Heroku button.
2. Create Slack Outgoing Webhook using URL from deploy.  

  `https://slack.com/apps/build > Make a Custom Integration > Outgoing Webhooks`
4. Create and authorize app through Twitter.
NOTE: This could be problematic because the user will need to set up an app through the Twitter API themselves.
5. Add your Twitter API Key and Secret Key as environment variables through Heroku.
6. Add your Slack team domain and token from the Outgoing Webhook your created as environment variables.
7. Sign in to app (using Twitter OAuth).
8. Get to tweeting!
