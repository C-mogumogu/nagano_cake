class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :post_code, presence: true, length: { is: 7 }
  validates :address, presence: true

end
