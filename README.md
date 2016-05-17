# Tweet from Slack!
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/LaunchPadLab/slack_twitter_app/tree/dev)

[![Code Climate](https://codeclimate.com/repos/5727c3e0b7eacc22740059a0/badges/c6e5cf6f1cce6491948d/gpa.svg)](https://codeclimate.com/repos/5727c3e0b7eacc22740059a0/feed)

An app to send tweets from a Slack channel to Twitter.

TODO - add a more marketable general description and a detailed description including requirements (ie paid heroku account)

TODO - add a lpl logo

By [LaunchPad Lab](http://launchpadlab.com).

***

## Setup
1. [Create a new Slack Outgoing Webhook](#create-a-new-slack-outgoing-webhook)
2. [Create a new Twitter Application](#create-a-new-twitter-application)
3. [Deploy to Heroku](#deploy-to-heroku)
4. [Update URLs](#update-urls)
5. [Final Steps](#final-steps)

### Create a new Slack Outgoing Webhook

Create a new Slack Outgoing Webhook using your account.

[Slack Custom Integration](https://slack.com/apps/build/custom-integration) > Outgoing Webhooks

* Add Outgoing WebHooks integration (if this is your first integration)
* Trigger Word: This is the command used to send the tweet. We use 'tweet', but you can use whatever you want.
* URL: `https://YOURAPPNAME.herokuapp.com/slack_webhooks` (we will update this later)
* Keep this window open, we will need some of the settings later.

TODO - update screenshot to reflect above

![Slack screenshot](app/assets/images/slack1.png)
![Slack screenshot](app/assets/images/slack3.png)

***

### Create a new Twitter Application

Create a new Twitter application using your account. If you haven't already, you will have to add your phone number to your Twitter account before you can create a Twitter application.

[Twitter Apps](https://apps.twitter.com/) > Create New App

* Name: anything
* Description: anything
* Website: `https://YOURAPPNAME.herokuapp.com` (we will update this later)
* Callback URL: `https://YOURAPPNAME.herokuapp.com/auth/twitter/callback` (we will update this later)
* Agree to the Developer Agreement
* Create your Twitter application
* Keep this window open, we will need some of the settings later.

TODO - update screenshot to reflect above

![Twitter screenshot](app/assets/images/twitter1.png)

***

### Deploy to Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/LaunchPadLab/slack_twitter_app/tree/dev) (Click me)

* App Name: anything (we will replace 'YOURAPPNAME' in the Slack and Twitter configuration with this value)
* Config variables
 * TWITTER_KEY: Consumer Key from Twitter
 * TWITTER_SECRET_KEY: Consumer Secret from Twitter
 * SLACK_TEAM_DOMAIN: Your slack team domain (ours is 'launchpadlab')
 * SLACK_TOKEN: Token from Slack Outgoing Webhook configuration

TODO - add screenshot

### Update URLs
Replace 'YOURAPPNAME' with your Heroku app name in:
* Slack URL
* Twitter Website
* Twitter Callback URL

### Final Steps
Visit your freshly deployed Heroku app and sign in with your Twitter credentials and start tweeting from Slack!!!
