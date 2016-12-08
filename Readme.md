# Dialog Ruby

A ruby client for the [Dialog](https://dialoganalytics.com) API.

[![Dependency Status](https://gemnasium.com/badges/github.com/dialoganalytics/dialog-ruby.svg)](https://gemnasium.com/github.com/dialoganalytics/dialog-ruby)
[![Gem Version](https://badge.fury.io/rb/dialog-api.svg)](https://badge.fury.io/rb/dialog-api)

## Documentation

See the [API docs](https://docs.dialoganalytics.com).

## Examples

- Amazon Alexa (soon)
- Google Actions (soon)
- [Facebook Messenger](https://github.com/dialoganalytics/messenger-ruby-example)
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

This library needs to be configured with your API token which is available in your [personal account](http://app.dialoganalytics.com/users/edit) and a bot ID.

```ruby
dialog = Dialog.new({
  api_token: ENV['DIALOG_API_TOKEN'],
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
conversation_id = '8aa172f13bf8'

var link = {
  "type": "web_url",
  "url": dialog.link(conversation_id, 'http://example.com'), # https://api.dialoganalytics.com/v1/click/8aa172f13bf8?url=http%3A%2F%2Fexample.com
  "title": "View Item"
}
```

### Messages

Retrieve a message. See [docs.dialoganalytics.com/reference/message#retrieve](https://docs.dialoganalytics.com/reference/message#retrieve)

```ruby
Dialog::Message.retrieve(conversationId, messageId)
```

List all messages in a conversation. See [docs.dialoganalytics.com/reference/message#list](https://docs.dialoganalytics.com/reference/message#list)

```ruby
Dialog::Message.list(conversationId)
```

### Conversations

Retrieve a conversation. See [docs.dialoganalytics.com/reference/conversation#retrieve](https://docs.dialoganalytics.com/reference/conversation#retrieve)

```ruby
Dialog::Conversation.retrieve(conversationId)
```

List all conversations. See [docs.dialoganalytics.com/reference/conversation#list](https://docs.dialoganalytics.com/reference/conversation#list)

```ruby
Dialog::Conversation.list
```

### Interlocutors

Retrieve an interlocutor. See [docs.dialoganalytics.com/reference/interlocutor#retrieve](https://docs.dialoganalytics.com/reference/interlocutor#retrieve)

```ruby
Dialog::Interlocutor.retrieve(interlocutorId)
```

List all interlocutors. See [docs.dialoganalytics.com/reference/interlocutor#list](https://docs.dialoganalytics.com/reference/interlocutor#list)

```ruby
Dialog::Interlocutor.list
```

Create an interlocutor. See [docs.dialoganalytics.com/reference/interlocutor#create](https://docs.dialoganalytics.com/reference/interlocutor#create)

```ruby
Dialog::Interlocutor.create(params)
```

### Multiple clients

Different parts of your application may require different types of configurations or even sending to multiple bots. In that case, you can initialize multiple instances of Dialog with different settings:

```ruby
messenger_dialog = Dialog.new(api_token: ENV['DIALOG_API_TOKEN'], bot_id: 'messenger_bot_id')

kik_dialog = Dialog.new(api_token: ENV['DIALOG_API_TOKEN'], bot_id: 'kik_bot_id')
```

## Development

Run all tests:

```bash
bundle exec rspec
```
