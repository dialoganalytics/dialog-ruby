module Dialog
  module API
    module Interlocutors

      # @param bot_id [String]
      def interlocutors(bot_id)
        get("/b/#{bot_id}/interlocutors")
      end

      # @param id [String]
      # @param bot_id [String]
      def interlocutor(id, bot_id)
        get("/b/#{bot_id}/interlocutors#{id}")
      end
    end
  end
end
