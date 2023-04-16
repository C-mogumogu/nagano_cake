class Item < ApplicationRecord
  belongs_to :genre

  has_one_attached :image

  enum sell_status: { sold_out: 0, now_on_sale: 1 }

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def with_tax_price
    (price * 1.1).floor
  end

  has_many :cart_items, dependent: :destroy

end
