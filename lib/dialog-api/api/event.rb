module Dialog
  module API
    module Event

      # Helper method to create an event
      # @param name [String] Event name
      # @param name [Float] Unix datetime in milliseconds
      # @param name [String] Interlocutor tied to the event
      # @param name [Hash] Event properties
      # @return [Hash]
      def event(name, created_at, interlocutor_id, properties)
        create_event({ name: name, created_at: created_at, interlocutor_id: interlocutor_id, properties: properties })
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
