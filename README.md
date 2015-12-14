# Heroku Scaler

The Heroku Scaler gem allows for free scaling of Heroku web dynos.
It exposes 3 simple rake tasks that can be called from the free [Heroku
Scheduler](https://elements.heroku.com/addons/scheduler).

This is perfect for applications that see heavy use during known times of the day or week.  For example, we have some customers with business systems that see 99.9% of their traffic during regular business hours on the weekdays.  Since Heroku charges for dynos based on the number of seconds the dynos are running, scaling down application dynos during off-peak times can mean big savings.  Running your larger dyno setup only during business hours - which is only 25% of the time - can save a bundle!  There are other tools that purport to do this but they often charge money and have, in our experience, been poorly supported.

## Commands

The Heroku Scaler gem exposes three rake commands when added to a Rails application.

The below command will scale your application web dynos to the SCALE_BIG_DYNO_COUNT and SCALE_BIG_DYNO_TYPE.

`rake heroku_scale:web:up`

The below command will scale your application web dynos to the SCALE_SMALL_DYNO_COUNT and SCALE_SMALL_DYNO_TYPE.

`rake heroku_scale:web:down`

The below command will scale your application web dynos to the SCALE_BIG_DYNO_COUNT and SCALE_BIG_DYNO_TYPE if it is a weekday.

`rake heroku_scale:web:up_if_weekday`

## Configuration options

All of these configuration options can be set through the Heroku application configuration (`heroku config:set SOME_SETTING=some_value`)

| Setting | Default | |
| --- | --- | --- |
| SCALE_APP_NAME| | your Heroku application name |
| SCALE_BIG_DYNO_COUNT | 3 | the number of scaled up dynos |
| SCALE_BIG_DYNO_TYPE | Standard-2X | the type of scaled up dyno |
| SCALE_OAUTH_TOKEN | | Heroku account auth token |
| SCALE_SMALL_DYNO_COUNT | 1 | the number of scaled down dynos |
| SCALE_SMALL_DYNO_TYPE | Standard=1X | the type of scaled down dyno |

## Installation

1. Add Heroku Scaler to your Rails application.

  add the gem to your `Gemfile`

  `gem "heroku_scaler"`

  User Bundler to install the gem in your project

  ```shell
  bundle
  ```

1. Generate an API Key from an appropriate Heroku account ("Manage account" -> "API Key")

1. Add settings to your Heroku configuration.

  Assuming a Heroku application named "my-cool-app":

  ```shell
  heroku config:set SCALE_APP_NAME=my-cool-app
  heroku config:set SCALE_BIG_DYNO_COUNT=2
  heroku config:set SCALE_BIG_DYNO_TYPE=Standard-1X
  heroku config:set SCALE_OAUTH_TOKEN=heroku_api_key_here
  heroku config:set SCALE_SMALL_DYNO_COUNT=2
  heroku config:set SCALE_SMALL_DYNO_TYPE=Standard-2X
  ```
1. Install the [Heroku
Scheduler](https://elements.heroku.com/addons/scheduler) into your Heroku application.

1. Add scheduled events at the times you wish for your application to scale up or down.

## Running tests

```shell
bundle
bundle exec rspec spec
```

## Left to do

1. Add support for time zones so the `heroku_scale:web:up_if_weekday` task behaves as expected in all time zones.
2. Add support for scaling Heroku workers

## Contributing

Please feel free to submit pull requests or issues. Support for more servers would be neat.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## About Foraker Labs

[![Foraker Logo](http://assets.foraker.com/attribution_logo.png)](https://www.foraker.com/)

[Foraker Labs](https://www.foraker.com/) builds exciting web and mobile apps in Boulder, CO. Our work powers a wide variety of businesses with many different needs. We love open source software, and we're proud to contribute where we can. Interested to learn more? [Contact us today](https://www.foraker.com/contact-us).

This project is maintained by Foraker Labs. The names and logos of Foraker Labs are fully owned and copyright Foraker Design, LLC.
