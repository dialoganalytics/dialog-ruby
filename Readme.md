# Dialog Ruby

A ruby client for the [Dialog](https://dialoganalytics.com) API.

[![Dependency Status](https://gemnasium.com/badges/github.com/dialoganalytics/dialog-node.svg)](https://gemnasium.com/github.com/dialoganalytics/dialog-node)
[![Gem Version](https://badge.fury.io/rb/dialog-api.svg)](https://badge.fury.io/rb/dialog-api)

## Documentation

See the [API docs](https://docs.dialoganalytics.com).

## Installation

```bash
gem install dialog-api
```

Or with bundler:

```ruby
gem 'dialog-api', require: 'dialog-api'
```

## Usage

This library needs to be configured with your API token which is available in your [personal account](http://app.dialoganalytics.com/users/edit) and a bot Id.

```ruby
dialog = Dialog.new({
  api_token: 'DIALOG_API_TOKEN',
  bot_id: 'bot_id',
  on_error: Proc.new do |status, message, detail|
    p [status, message, detail]
  end
})
```

### Tracking messages

#### Generic

See [docs.dialoganalytics.com/reference/track](https://docs.dialoganalytics.com/reference/track)

```ruby
payload = {}
dialog.track(payload)
```

### Tracking clicks

Track links (or anything with a URL) clicked by users inside a conversation. Pass the conversation's distinct Id (provided by the platform or provider) and the `url`. See [docs.dialoganalytics.com/reference/click-tracking](https://docs.dialoganalytics.com/reference/click-tracking/)

```ruby
id = conversation_distinct_id

var link = {
  "type": "web_url",
  "url": dialog.link(id, 'http://example.com'), # https://api.dialoganalytics.com/v1/click/:id?url=http%3A%2F%2Fexample.com
  "title": "View Item"
}
```

### Multiple clients

Different parts of your application may require different types of configurations or even sending to multiple bots. In that case, you can initialize multiple instances of Dialog with different settings:

```ruby
messenger_dialog = Dialog.new(api_token: 'dialog_api_token', bot_id: 'messenger_bot_id')

kik_dialog = Dialog.new(api_token: 'dialog_api_token', bot_id: 'kik_bot_id')
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
