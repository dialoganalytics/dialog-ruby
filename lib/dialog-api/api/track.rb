module Dialog
  module API
    module Track

      # Tracks a message
      # @param payload [Hash]
      # @return
      def track(payload)
        post("b/#{bot_id}/track", body: payload)
      end
    end
  end
end
