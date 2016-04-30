require 'faraday'
require 'faraday_middleware'

module Dialog
  module Connection

    # Instantiate a Faraday::Connection
    # @private
    private

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      Faraday.new(url: api_endpoint) do |c|
        c.headers[:user_agent] = Dialog.user_agent
        c.request :json

        c.response :json, content_type: /\bjson$/

        # raise exceptions on 40x, 50x responses
        c.use Faraday::Response::RaiseError

        c.adapter Faraday.default_adapter
      end
    end
  end
end
