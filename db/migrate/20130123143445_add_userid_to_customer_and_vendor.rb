class AddUseridToCustomerAndVendor < ActiveRecord::Migration
  def change
    add_column :customers,:userid,:integer
    add_column :vendors,:userid,:integer
  end
end
