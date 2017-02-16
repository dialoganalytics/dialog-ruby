module Dialog
  module API
    module Interlocutor

      # Lists all interlocutors
      # @return [Array]
      def interlocutors
        get("b/#{bot_id}/interlocutors")
      end

      # Retrieves an interlocutor
      # @param id [String] Interlocutor distinct Id
      # @return [Hash]
      def interlocutor(id)
        get("b/#{bot_id}/interlocutors/#{id}")
      end

      # Updates an interlocutor
      # @param id [String] Interlocutor Id
      # @param payload [Hash]
      # @return [Hash]
      def update_interlocutor(id, payload)
        patch("b/#{bot_id}/interlocutors/#{id}", body: { interlocutor: payload })
      end
    end
  end
end
