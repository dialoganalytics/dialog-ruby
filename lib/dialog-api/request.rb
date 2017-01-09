require 'http'

module Dialog
  module Request

    # Performs a HTTP Get request
    #
    # @param path [String]
    # @param params [Hash]
    def get(path, params: {})
      request(:get, URI.parse(api_endpoint).merge(path), params: params)
    end

    # Performs a HTTP Post request
    #
    # @param path [String]
    # @param params [Hash]
    # @param body [Hash]
    def post(path, params: {}, body: {})
      request(:post, URI.parse(api_endpoint).merge(path), params: params, body: body)
    end


    private

    # @return [HTTP::Client]
    # @raise [ArgumentError]
    def request(method, path, params: {}, body: {})
      raise ArgumentError, ("Please configure Dialog.api_token first") if api_token.nil? || api_token.empty?
      raise ArgumentError, ("Please configure Dialog.bot_id first") if bot_id.nil? || bot_id.empty?

      headers = {
        'Accept'        => "application/json",
        'Authorization' => "Api-Key #{api_token}",
        'User-Agent'    => Dialog.user_agent
      }

      response = Http.headers(headers).send(method, path, params: params, json: body)

      if debug
        p response
      end

      # Pass on errors when HTTP status included in 400 to 599
      if (400..599).include?(response.code)
        begin
          body = response.parse['error']
        rescue HTTP::Error
          body = nil
        end

        on_error.call(response.code, response.reason, body)
      end

      # Return parsed json body
      response.parse
    end
  end
end
