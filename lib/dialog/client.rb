require 'dialog/connection'
require 'dialog/request'
require 'dialog/api/conversations'
require 'dialog/api/interlocutors'
require 'dialog/api/messages'
require 'dialog/api/track'

module Dialog
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # @param options [Hash]
    def initialize(options = {})
      options = Dialog.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Dialog::Connection
    include Dialog::Request
    include Dialog::API::Conversations
    include Dialog::API::Interlocutors
    include Dialog::API::Messages
    include Dialog::API::Track
  end
end
