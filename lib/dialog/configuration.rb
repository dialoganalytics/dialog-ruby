require 'dialog/version'

module Dialog
  module Configuration
    VALID_OPTIONS_KEYS    = [:api_endpoint, :api_token, :user_agent, :bot_id].freeze

    DEFAULT_API_ENDPOINT  = "https://api.dialoganalytics.com/v1"
    DEFAULT_API_TOKEN     = nil
    DEFAULT_USER_AGENT    = "Dialog Ruby Gem #{Dialog::VERSION}".freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset!
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    def options
      Hash[ * VALID_OPTIONS_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    def reset!
      self.api_endpoint = DEFAULT_API_ENDPOINT
      self.api_token    = DEFAULT_API_TOKEN
      self.user_agent   = DEFAULT_USER_AGENT
      self.bot_id       = nil

      return true
    end
  end
end
