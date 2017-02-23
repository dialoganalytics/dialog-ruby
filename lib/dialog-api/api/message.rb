module Dialog
  module API
    module Message

      # Lists all messages associated to a conversation
      # @param conversation_id [String] Conversation Id
      # @return [Array]
      def messages(conversation_id)
        get("b/#{bot_id}/conversations/#{conversation_id}/messages")
      end

      # Retrieves a message
      # @param id [String]
      # @param conversation_id [String] Conversation Id
      # @return [Hash]
      def message(id, conversation_id)
        get("b/#{bot_id}/conversations/#{conversation_id}/messages/#{id}")
      end
    end
  end
end
