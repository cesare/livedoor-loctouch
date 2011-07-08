module Livedoor
  class Loctouch
    module Relationship
      def relationship_follow(user_id)
        post "relationships/follow", { user_id: user_id }
      end
      
      def relationship_unfollow(user_id)
        post "relationships/unfollow", { user_id: user_id }
      end
      
      def relationship_received_requests
        get "relationships/received_requests"
      end
      
      def relationships_accept(user_id)
        post "relationships/accept", { user_id: user_id }
      end
    end
  end
end
