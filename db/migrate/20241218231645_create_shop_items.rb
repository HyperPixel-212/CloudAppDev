class CreateShopItems < ActiveRecord::Migration[8.0]
  def change
    create_table :shop_items do |t|
      t.string :name
      t.string :description
      t.integer :amount
      t.float :price

      t.timestamps
    end
  end
end
