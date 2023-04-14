class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :post_code, limit: 7
      t.string :address
      t.string :name
      t.integer :postage, default: 800
      t.integer :total_price
      t.integer :payment_method, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
