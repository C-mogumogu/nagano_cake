class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
