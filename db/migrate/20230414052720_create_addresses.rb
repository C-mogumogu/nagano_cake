class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.integer :customer_id
      t.string :name
      t.string :post_code, limit: 7
      t.string :address

      t.timestamps
    end
  end
end
