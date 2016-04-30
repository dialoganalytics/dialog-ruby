module Dialog
  module API
    module Track

      # @param message [String]
      # @param uid [String]
      # @param properties [Hash]
      def track(message, uid=nil, properties = {})
        body = {
          message: {
            uid: uid,
            message: message,
            properties: properties
          }
        }

        post("/track", {}, body)
      end
    end
  end
end
