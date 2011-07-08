module Livedoor
  class Loctouch
    module Category
      def categories
        get "categories"
      end
      
      def category(category_id)
        get "categories/#{category_id}"
      end
    end
  end
end
