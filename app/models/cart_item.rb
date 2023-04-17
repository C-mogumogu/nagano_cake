class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  def subtotal
    item.with_tax_price*amount
  end
  
  def total_price
    cart_item.subtotal.sum
  end
end
