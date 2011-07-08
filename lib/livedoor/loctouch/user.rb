module Livedoor
  class Loctouch
    module User
      def users_search(query, options = {})
        get('users/search', { query: query }.merge(options))
      end

      def user(id)
        get("users/#{id}")
      end

      def user_timeline(id, options = {})
        user_get(id, "timeline", options)
      end

      def user_touches(id, options = {})
        user_get(id, "touches", options)
      end

      def user_photos(id, options = {})
        user_get(id, "photos", options)
      end

      def user_stickers(id)
        user_get(id, "stickers")
      end

      def user_followers(id, options = {})
        user_get(id, "followers", options)
      end

      def user_following(id, options = {})
        user_get(id, "following", options)
      end

      def user_leaderships(id, options = {})
        user_get(id, "leaderships", options)
      end


      private
      def user_get(id, path, options = nil)
        get("users/#{id}/#{path}", options)
      end
    end
  end
end