module Livedoor
  class Loctouch
    module Spot
      def search(latitude, longitude, options)
        get "spots/search", { lat: latitude, lng: longitude }.merge(options)
      end
      
      def spot(id)
        get "spots/#{id}"
      end
      
      def spot_touches(id)
        spot_get(id, "touches")
      end
      
      def spot_notes(id)
        spot_get(id, "notes")
      end
      
      def spot_leader(id)
        spot_get(id, "leader")
      end
      
      def spot_supporters(id)
        spot_get(id, "supporters")
      end
      
      
      private
      def spot_get(id, path)
        get("spots/#{id}/#{path}")
      end
    end
  end
end