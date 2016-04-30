# Dialog-ruby

A ruby client for the [Dialog](https://dialog.io) conversational analytics api.

__PLEASE NOTE:__ THIS IS A PROOF OF CONCEPT AND THE API IS NOT YET ACCESSIBLE

## Usage

### Telegram

```ruby
require 'telegram/bot'

Telegram::Bot::Client.run(token) do |bot|
  v = Dialog.new(api_token: 'dialog_api_token')

  bot.listen do |message|
    case message.text
    when '/start'
      properties = {
        platform: 'telegram'
      }

      v.track(message.from.id, 'start', message, properties)

      # ...
    end
  end
end
```
