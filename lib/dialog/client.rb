require 'dialog/request'
require 'dialog/api/conversation'
require 'dialog/api/interlocutor'
require 'dialog/api/message'
require 'dialog/api/track'

module Dialog
  class Client
    include Dialog::Request
    include Dialog::API::Conversation
    include Dialog::API::Interlocutor
    include Dialog::API::Message
    include Dialog::API::Track

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # @param options [Hash]
    def initialize(options = {})
      options = Dialog.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end
end
