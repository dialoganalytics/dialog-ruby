# Dialog Ruby

A ruby client for the [Dialog](https://dialoganalytics.com) API.

[![Dependency Status](https://gemnasium.com/badges/github.com/dialoganalytics/dialog-ruby.svg)](https://gemnasium.com/github.com/dialoganalytics/dialog-ruby)
[![Gem Version](https://badge.fury.io/rb/dialog-api.svg)](https://badge.fury.io/rb/dialog-api)

## Examples

- Amazon Alexa (soon)
- Google Actions (soon)
- [Facebook Messenger](https://github.com/dialoganalytics/messenger-ruby-example)
- [Telegram](https://github.com/dialoganalytics/telegram-ruby-example)
- Kik (soon)
- Twilio Programmable Chat (soon)
- [Twilio SMS](https://github.com/dialoganalytics/twilio-sms-ruby-example)

## Installation

```bash
gem install dialog-api
```

Or with bundler:

```ruby
gem 'dialog-api', require: 'dialog-api'
```

## Usage

This library needs to be configured with your API token which is available in your [personal account](http://app.dialoganalytics.com/users/edit), and a bot ID.

```ruby
dialog = Dialog.new({
  api_token: ENV['DIALOG_API_TOKEN'],
  bot_id: ENV['DIALOG_BOT_ID'],
  on_error: Proc.new do |status, message, detail|
    p [status, message, detail]
  end
})
```

### Tracking messages

#### Generic

See [docs.dialoganalytics.com/reference/track](https://docs.dialoganalytics.com/reference/track)

```ruby
payload =
  message: {
    platform: "messenger",
    provider: "dialog-ruby",
    mtype: "text",
    sent_at: 1482266741.18,
    nlp: {
      intents: [
        {
          name: "order.create",
          confidence: 0.98
        }
      ]
    },
    properties: {
      text: "Hello world"
    }
  },
  conversation: {
    distinct_id: "da58db1e-da73-4628-9dd6-11a524cc3f80"
  },
  creator: {
    distinct_id: "d5ae3f5f-1645-40c3-a38a-02382cd0ee49",
    type: "interlocutor",
    username: "@elon",
    first_name: "Elon",
    last_name: "Musk",
    email: "elon@spacex.com",
    gender: "male",
    locale: "US",
    phone: "1234567890",
    profile_picture: "http://spacex.com/elon.jpg",
    timezone: -5
  }
}

dialog.track(payload)
```

### Events

Send events to Dialog to keep track of your custom logic. Optionally pass an `interlocutor_id` to tie the event to one of your bot's interlocutors. See [docs.dialoganalytics.com/reference/event#create](https://docs.dialoganalytics.com/reference/event#create)

```ruby
dialog.event('subscribed', Time.now.to_f, 'interlocutor_id', { custom: 'value' })
```

### Tracking clicks

Track links clicked by interlocutors inside a conversation. Pass the Interlocutor's `distinct_id` (provided by the platform or provider) and the `url`. See [docs.dialoganalytics.com/reference/click-tracking](https://docs.dialoganalytics.com/reference/click-tracking/)

```ruby
dialog.link('http://example.com', interlocutor_distinct_id)
# => https://api.dialoganalytics.com/v1/b/7928374/clicks/?id=123456&url=http%3A%2F%2Fexample.com
```

### Messages

#### Retrieve a message

See [docs.dialoganalytics.com/reference/message#retrieve](https://docs.dialoganalytics.com/reference/message#retrieve)

```ruby
dialog.message(conversation_id, message_id)
```

#### List all messages

List all messages in a conversation. See [docs.dialoganalytics.com/reference/message#list](https://docs.dialoganalytics.com/reference/message#list)

```ruby
dialog.messages(conversation_id)
```

### Conversations

#### Retrieve a conversation

See [docs.dialoganalytics.com/reference/conversation#retrieve](https://docs.dialoganalytics.com/reference/conversation#retrieve)

```ruby
dialog.conversation(conversation_id)
```

#### List all conversations

See [docs.dialoganalytics.com/reference/conversation#list](https://docs.dialoganalytics.com/reference/conversation#list)

```ruby
dialog.conversations
```

### Interlocutors

#### List all interlocutors

See [docs.dialoganalytics.com/reference/interlocutor#list](https://docs.dialoganalytics.com/reference/interlocutor#list)

```ruby
dialog.interlocutors
```

#### Retrieve an interlocutor

See [docs.dialoganalytics.com/reference/interlocutor#retrieve](https://docs.dialoganalytics.com/reference/interlocutor#retrieve)

```ruby
dialog.interlocutor(interlocutor_id)
```

#### Update an interlocutor

See [docs.dialoganalytics.com/reference/interlocutor#update](https://docs.dialoganalytics.com/reference/interlocutor#update)

```ruby
dialog.update_interlocutor(interlocutor_id, params)
```

#### Creating an interlocutor

To create an interlocutor, use the `track` endpoint. An interlocutor must initially be created in association with a conversation. See [docs.dialoganalytics.com/reference/track](https://docs.dialoganalytics.com/reference/track/)

### Multiple clients

Different parts of your application may require different types of configurations or even sending to multiple bots. In that case, you can initialize multiple instances of Dialog with different settings:

```ruby
messenger_dialog = Dialog.new(api_token: ENV['DIALOG_API_TOKEN'], bot_id: 'messenger_bot_id')

kik_dialog = Dialog.new(api_token: ENV['DIALOG_API_TOKEN'], bot_id: 'kik_bot_id')
```

## Documentation

See the [API docs](https://docs.dialoganalytics.com).

## Development

Run all tests:

```bash
bundle exec rspec
```
