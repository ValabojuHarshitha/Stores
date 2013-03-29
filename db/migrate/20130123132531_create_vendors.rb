class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :vendor_name
      t.string :contact
      t.string :description

      t.timestamps
    end
  end
end
