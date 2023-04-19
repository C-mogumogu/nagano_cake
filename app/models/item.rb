class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :sell_status, presence: true

  enum sell_status: { sold_out: 0, now_on_sale: 1 }

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
