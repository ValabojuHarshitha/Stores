class AddLocationidToStoreCategory < ActiveRecord::Migration
  def change
    add_column :store_categories ,:location_id ,:integer
  end
end
