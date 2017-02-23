module Dialog
  module API
    module Event

      # Helper method to create an event
      # @param name [String] Event name
      # @param interlocutor_distinct_id [String] Interlocutor distinct Id
      # @param properties [Hash] Event properties
      # @return [Hash]
      def event(name, interlocutor_distinct_id, properties)
        create_event({ name: name, created_at: Time.now.to_f, id: interlocutor_distinct_id, properties: properties })
      end

      # Creates an event
      # @param payload [Hash]
      # @return [Hash]
      def create_event(payload)
        post("b/#{bot_id}/events", body: { event: payload })
      end
    end
  end
end
