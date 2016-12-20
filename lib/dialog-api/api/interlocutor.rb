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
      # @param payload [Hash]
      # @return [Hash]
      def create_interlocutor(payload)
        post("b/#{bot_id}/interlocutors", body: { interlocutor: payload })
      end
    end
  end
end
