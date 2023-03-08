# Ruby Beaconcha

[![Gem Version](https://badge.fury.io/rb/beaconcha.svg)](https://badge.fury.io/rb/beaconcha)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/liuliang/beaconcha/blob/main/LICENSE.txt)
[![CircleCI Build Status](https://circleci.com/gh/liuliang/beaconcha.svg?style=shield)](https://circleci.com/gh/liuliang/beaconcha)
[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/codeclimate/codeclimate/maintainability)

Use the [Beaconcha API](https://beaconcha.in/api/v1/docs/index.html) with Ruby! 

## Installation

### Bundler

Add this line to your application's Gemfile:

```ruby
    gem "beaconcha"
```

And then execute:

$ bundle install

### Gem install

Or install with:

$ gem install beaconcha

and require with:

```ruby
    require "beaconcha"
```

## Usage

- Get your API key from [https://beaconcha.in/user/settings#api](https://beaconcha.in/user/settings#api)

### Quickstart

For a quick test you can pass your token directly to a new client:

```ruby
    client = Beaconcha::Client.new(api_key: "api_key_goes_here", uri_base: "https://beaconcha.in")
```

### With Config

For a more robust setup, you can configure the gem with your API keys, for example in an `beaconcha.rb` initializer file. Never hardcode secrets into your codebase - instead use something like [dotenv](https://github.com/motdotla/dotenv) to pass the keys safely into your environments.

```ruby
    Beaconcha.configure do |config|
        config.api_key = ENV.fetch('BEACONCHA_API_KEY')
        config.uri_base = ENV.fetch('BEACONCHA_URI_BASE')
    end
```

Then you can create a client like this:

```ruby
    client = Beaconcha::Client.new
```

### Example

```ruby
    client.epoch.retrieve(id: 10000)
    client.eth_store.retrieve(day: "latest")
    client.execution.eth1deposit(txhash: "xxxx")
    client.execution.produced(id: "xxxx", limit: 1, offset: 1)
    client.misc.healthz
    client.rocketpool.stats
    client.slot.retrieve(id: "xxxx")
    client.sync_committee.retrieve(period: "xxxx")
    client.validator.retrieve(id: "xxxx")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Release

First run the specs without VCR so they actually hit the API. This will cost about 2 cents. You'll need to add your `BEACONCHA_API_KEY=` in `.env`.

```
  NO_VCR=true bundle exec rspec
```

Then update the version number in `version.rb`, update `CHANGELOG.md`, run `bundle install` to update Gemfile.lock, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/liuliang/beaconcha>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/liuliang/beaconcha/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby Beaconcha project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/liuliang/beaconcha/blob/main/CODE_OF_CONDUCT.md).
