class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_one_attached :image
    
    def get_image
      (image.attached?) ? image : 'no_image.jpg'
    end
    
    def with_tax_price
      (price*1.1).floor
    end
end
