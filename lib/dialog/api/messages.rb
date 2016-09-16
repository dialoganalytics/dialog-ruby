module Dialog
  module API
    module Messages

      # @param conversation_id [String]
      # @param bot_id [String]
      def messages(conversation_id, bot_id)
        get("/b/#{bot_id}/conversations/#{conversation_id}/messages")
      end

      # @param id [String]
      # @param conversation_id [String]
      # @param bot_id [String]
      def message(id, conversation_id, bot_id)
        get("/b/#{bot_id}/conversations/#{conversation_id}/messages#{id}")
      end
    end
  end
end
