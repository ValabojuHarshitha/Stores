class CreateCustomerItems < ActiveRecord::Migration
  def change
    create_table :customer_items do |t|
      t.integer :customer_list_id
      t.integer :item_id

      t.timestamps
    end
  end
end
