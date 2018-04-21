class CreateMarketItemOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :market_item_orders do |t|
      t.string :item_order
      t.string :unit
      t.float :price

      t.timestamps
    end
  end
end
