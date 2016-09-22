module Dialog
  module API
    module Interlocutor

      # Lists all interlocutors
      # @return [Array]
      def interlocutors
        get("b/#{bot_id}/interlocutors")
      end

      # Retrieves an interlocutor
      # @param id [String] Interlocutor Id
      # @return [Hash]
      def interlocutor(id)
        get("b/#{bot_id}/interlocutors#{id}")
      end

      # Creates an interlocutor
      # @param attributes [Hash]
      # @return [Hash]
      def create_interlocutor(attributes)
        post("b/#{bot_id}/interlocutors", body: { interlocutor: attributes })
      end
    end
  end
end
