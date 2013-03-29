class AddCategorynametoStoreCategories < ActiveRecord::Migration
  def up
    add_column :store_categories,:category_name,:string
  end

  def down
  end
end
