module Dialog
  module API
    module Conversation

      # Lists all conversations
      # @return [Array]
      def conversations
        get("b/#{bot_id}/conversations")
      end

      # Retrieves a conversation
      # @param id [String] Conversation Id
      # @return [Hash]
      def conversation(id)
        get("b/#{bot_id}/conversations/#{id}")
      end
    end
  end
end
