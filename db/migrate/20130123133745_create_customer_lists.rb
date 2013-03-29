class CreateCustomerLists < ActiveRecord::Migration
  def change
    create_table :customer_lists do |t|
      t.integer :customer_id
      t.integer :customer_store_id
      t.string :list_name

      t.timestamps
    end
  end
end
