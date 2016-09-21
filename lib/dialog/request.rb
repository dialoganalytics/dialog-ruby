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
    def request(method, path, params: {}, body: {})
      raise ArgumentError, ("Please configure Dialog.api_token first") unless api_token
      raise ArgumentError, ("Please configure Dialog.bot_id first") unless bot_id

      headers = {
        'accept' => "application/json",
        'User-Agent' => Dialog.user_agent,
        'Authorization' => "Api-Key #{api_token}"
      }

      response = Http.headers(headers).send(method, path, params: params, json: body)


      # Return parsed json body
      response.parse
    end
  end
end
