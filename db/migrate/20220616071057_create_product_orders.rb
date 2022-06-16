class CreateProductOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :product_orders do |t|
    t.integer :product_id, null: false, default: ""
    t.integer :order_id, null: false, default: ""
    t.integer :quantity, null: false, default: ""
    t.integer :price, null: false, default: ""
    t.integer :making_status, null: false, default: ""
      t.timestamps
    end
  end
end
