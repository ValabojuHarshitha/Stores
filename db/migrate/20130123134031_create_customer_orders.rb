class CreateCustomerOrders < ActiveRecord::Migration
  def change
    create_table :customer_orders do |t|
      t.string :order_number
      t.integer :total_price
      t.boolean :payment_completed
      t.string :payment_type
      t.boolean :payment_approved

      t.timestamps
    end
  end
end
