require 'dialog-api/request'
require 'dialog-api/api/conversation'
require 'dialog-api/api/event'
require 'dialog-api/api/interlocutor'
require 'dialog-api/api/message'
require 'dialog-api/api/track'

module Dialog
  class Client
    include Dialog::Request
    include Dialog::API::Conversation
    include Dialog::API::Event
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

    # Wraps an url into a trackable Dialog url
    # @param url [String] An URL to redirect the user to
    # @param id [String] An interlocutor distinct Id provided by the platform or the provider
    # @return [String]
    def link(url, id)
      escaped = URI.escape(url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
      URI.join(api_endpoint, "v1/b/", bot_id, "/click/", "?id=#{id}&url=#{escaped}").to_s
    end
  end
end
