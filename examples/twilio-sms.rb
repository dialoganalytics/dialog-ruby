# This is an example integration of dialog-ruby with twilio-ruby (https://github.com/twilio/twilio-ruby)
#
# Get started:
#   1. Create an account on https://app.dialoganalytics.com
#   2. Find your API token in your personal settings page and your Bot ID in the bot's settings page
#   3. Clone this repository and run `bundle install`
#   4. Get your Twilio Account SID and Auth Token from www.twilio.com/console
#   5. Get a Twilio phone number from www.twilio.com/console/phone-numbers and set the webhook callback to the endpoint on which this server will be listening
#       - When developping locally use a service like ngrok.com to expose a server running on your machine. For example: `ngrok http 3456`
#       - This should be something like https://f562681e.ngrok.io/sms
#   6. Run this example by typing `ruby examples/twilio-sms.rb' from the repository root
#   7. Send a SMS to the phone number you defined previously. Messages will be sent to Dialog's API.
#   8. Read more on how to make the most out of the possibilities offered by Dialog here: https://docs.dialoganalytics.com

require 'bundler/setup'
require 'sinatra'
require 'twilio-ruby'
require 'dialog'

# Load environment variables from .env
require 'dotenv'
Dotenv.load

# Helpers to handle tracking with Dialog
class DialogTwilio

  def initialize(client)
    @client = client
  end

  # @param params [Hash]
  def incoming(params)
    payload = {
      creator_distinct_id: params['From'],
      creator_type: 'interlocutor',
      distinct_id: params['MessageSid'],
      sent_at: Time.now.to_f,
      properties: {
        text: params['Body']
      }
    }.merge(dialog_attributes(params))

    @client.track(payload)
  end

  # @param params [Hash]
  # @param message [String]
  def outgoing(params, message)
    payload = {
      creator_distinct_id: 'bot_id',
      creator_type: 'bot',
      distinct_id: SecureRandom.uuid,
      sent_at: Time.now.to_f,
      properties: {
        text: message
      }
    }.merge(dialog_attributes(params))

    @client.track(payload)
  end

  private

  # @param params [Hash]
  def dialog_attributes(params)
    {
      conversation_distinct_id: (params['From'] + params['To']).strip,
      platform: 'sms',
      provider: 'twilio',
      mtype: 'text',
    }
  end
end

# Create a Dialog API client
client = Dialog.new({
  api_token: ENV['DIALOG_API_TOKEN'],
  bot_id: '878ccd34-d218-42a9-bde9-11259c0ed3e1',
  on_error: Proc.new do |status, message, detail|
    p [status, message, detail]
  end
})

# Create a Dialog tracking helper
dialog = DialogTwilio.new(client)

# Receive a SMS
#
# Twilio payload:
#
#   {
#     "ToCountry"=>"CA",
#     "ToState" => "Québec",
#     "SmsMessageSid" => "SM031adc20211f6bdc0533cb93c53ac57f",
#     "NumMedia" => "0",
#     "ToCity" => "",
#     "FromZip" => "",
#     "SmsSid" => "SM031adc20211f6bdc0533cb93c53ac57f",
#     "FromState" => "QC",
#     "SmsStatus" => "received",
#     "FromCity" => "QUEBEC",
#     "Body" => "Hugh",
#     "FromCountry" => "CA",
#     "To"=>"+1 58 17004296",
#     "ToZip" => "",
#     "NumSegments" => "1",
#     "MessageSid" => "SM031adc20211f6bdc0533cb93c53ac57f",
#     "AccountSid" => "ACaf464a215129ea7cd739c2a948672250",
#     "From" => "+14185800893",
#     "ApiVersion" => "2010-04-01"
#   }
post '/sms' do
  content_type 'text/xml'

  # Track incoming message
  dialog.incoming(params)

  response = Twilio::TwiML::Response.new do |res|
    message = "Gotcha!"

    # Track outgoing message
    dialog.outgoing(params, message)

    res.message message
  end

  response.to_xml
end
