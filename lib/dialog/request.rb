module Dialog
  module Request

    # Performs a HTTP Get request
    #
    # @param path [String]
    # @param params [Hash]
    # @param body [Hash]
    def get(path, params={})
      request(:get, path, params)
    end

    # Performs a HTTP Post request
    #
    # @param path [String]
    # @param params [Hash]
    # @param body [Hash]
    def post(path, params={}, body={})
      request(:post, path, params, body)
    end


    private

    # Returns a Faraday::Response object
    #
    # @param method [Symbol]
    # @param path [String]
    # @param params [Hash]
    # @param body [Hash]
    # @return [Faraday::Response]
    def request(method, path, params={}, body={})
      raise ArgumentError, ("Please configure Dialog.api_token first") unless api_token

      response = connection.send(method) do |request|
        request.url(path, params)
        request.headers['HTTP_AUTHORIZATION'] = api_token
        request.body = body.to_json
      end

      response.body
    end
  end
end
