class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.text :introduction
      t.integer :genre_id
      t.integer :price
      t.integer :sell_status, default: 0

      t.timestamps
    end
  end
end
