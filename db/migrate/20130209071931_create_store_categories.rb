class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
      t.integer :store_id
      t.integer :category_type_id
      t.integer :parent_id
      t.string  :category_name
      t.timestamps
    end
  end
end
