# Dialog Ruby

A ruby client for the [Dialog](https://dialoganalytics.com) API.

[![Dependency Status](https://gemnasium.com/badges/github.com/dialoganalytics/dialog-node.svg)](https://gemnasium.com/github.com/dialoganalytics/dialog-node)

## Documentation

See the [API docs](https://docs.dialoganalytics.com).

## Installation

```bash
gem install dialog-ruby
```

Or with bundler:

```ruby
gem 'dialog-ruby'
```

## Usage

This library needs to be configured with your API token which is available in your [personal account](http://app.dialoganalytics.com/users/edit) and a bot Id.

```ruby
```

## Examples

### Telegram

```ruby
require 'telegram/bot'

Telegram::Bot::Client.run(telegram_token) do |bot|
  dialog = Dialog.new(api_token: 'dialog_api_token')

  bot.listen do |message|
    case message.text
    when '/start'
      dialog.track()

      # ...
    end
  end
end
```

## Development

Run all tests:

```bash
bundle exec rspec
```
