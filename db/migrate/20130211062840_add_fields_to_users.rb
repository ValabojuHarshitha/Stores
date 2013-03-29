class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users ,:street,:string
    add_column :users ,:address,:text
    add_column :users,:location_id,:integer
    add_column :users,:city_id,:integer
    add_column :users,:state_id,:integer
    add_column :users,:phone_number,:string
  end
end
