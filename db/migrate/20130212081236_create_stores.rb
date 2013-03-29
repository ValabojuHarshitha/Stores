class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name
      t.integer :location_id
      t.integer :city_id
      t.integer :vendor_id
      t.string :store_address
      t.timestamps
    end
  end
end
