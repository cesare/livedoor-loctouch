module Livedoor
  class Loctouch
    module Note
      def note(note_id)
        get "notes/#{note_id}"
      end
      
      def note_add(spot_id, options = {})
        post "notes", { spot_id: spot_id }.merge(options)
      end
    end
  end
end