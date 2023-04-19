class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { production_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }
  
  def subtotal
    price*amount
  end
  
end
