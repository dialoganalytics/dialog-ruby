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

      # @param payload [Hash]
      # @return [Hash]
      end
    end
  end
end
