module Dialog
  module API
    module Conversations

      # @param bot_id [String]
      def conversations(bot_id)
        get("/b/#{bot_id}/conversations")
      end

      # @param id [String]
      # @param bot_id [String]
      def conversation(id, bot_id)
        get("/b/#{bot_id}/conversations/#{id}")
      end
    end
  end
end
