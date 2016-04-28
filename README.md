# slack_twitter_app

An app to send tweets from a Slack channel to Twitter.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/LaunchPadLab/slack_twitter_app&env[TWITTER_KEY]=WbHZPLYeVWt25Qx1EF2VgPT91&env[TWITTER_SECRET_KEY]=7Y9abtUIvQ8NFtqI2pKDWJrd3eV2eiekkvbuU74URjGyHMBvcc)

By [LaunchPad Lab](http://launchpadlab.com).

1. Click Deploy to Heroku button.
2. Create Slack Outgoing Webhook using URL from deploy.  

  `https://slack.com/apps/build > Make a Custom Integration > Outgoing Webhooks`
4. Create and authorize app through Twitter.
NOTE: This could be problematic because the user will need to set up an app through the Twitter API themselves.
3. Sign in to app (using Twitter OAuth).
4. Enter Slack team domain and token from Outgoing Webhook integration you created. (Could also set slack domain and token through ENV vars?)
5. Get to tweeting!
