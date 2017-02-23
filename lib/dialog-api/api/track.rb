require 'active_support/core_ext/hash/deep_merge'

module Dialog
  module API
    module Track

      # @param options [Hash, String] Properties to merge with the track payload
      # @return [Hash]
      def attach(options)
        if options.is_a?(String)
          @context = { message: { name: options }}
        else
          @context = options
        end
      end

      # Tracks a message
      # @param payload [Hash]
      # @return [Hash]
      def track(payload)
        body = payload.deep_merge(@context || {})
        @context = nil

        post("b/#{bot_id}/track", body: body)

        body
      end
    end
  end
end
