class AddLatitudeTostores < ActiveRecord::Migration
  def change
   add_column :stores ,:latitude ,:double
   add_column :stores ,:longitude ,:double
  end
end
