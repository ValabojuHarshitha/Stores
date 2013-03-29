class CreateLocationdistances < ActiveRecord::Migration
  def change
    create_table :locationdistances do |t|
      t.integer :location_id
      t.integer :destination_id
      t.float :radius

      t.timestamps
    end
  end
end
