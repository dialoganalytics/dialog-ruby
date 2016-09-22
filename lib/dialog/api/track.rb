module Dialog
  module API
    module Track

      # Tracks a message
      # @param payload [Hash]
      # @return
      def track(payload)
        body = {
          message: {
            conversation_distinct_id: payload[:conversation_distinct_id],
            creator_distinct_id: payload[:creator_distinct_id],
            creator_type: payload[:creator_type],
            distinct_id: payload[:distinct_id],
            platform: payload[:platform],
            provider: payload[:provider],
            mtype: payload[:mtype],
            sent_at: payload[:sent_at],
            properties: {
              text: payload[:text]
            }
          }
        }

        post("b/#{bot_id}/track", body: body)
      end
    end
  end
end
