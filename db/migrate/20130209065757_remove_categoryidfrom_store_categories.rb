class RemoveCategoryidfromStoreCategories < ActiveRecord::Migration
  def up
    remove_column :store_categories,:category_id
  end

  def down
  end
end
