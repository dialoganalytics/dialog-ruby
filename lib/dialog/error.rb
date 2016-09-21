module Dialog
  class Error < StandardError

    # @param response [HTTP::Response]
    def initialize(response)
      @response = response

      super(response.parse['error'])
    end
  end
end
