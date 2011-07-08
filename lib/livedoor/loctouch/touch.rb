module Livedoor
  class Loctouch
    module Touch
      def touch(touch_id)
        get "touches/#{touch_id}"
      end
      
      def touch_touch(spot_id, options = {})
        post "touches", { spot_id: spot_id }.merge(options)
      end
    end
  end
end
