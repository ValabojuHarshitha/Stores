class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_code
      t.string :country_name
      t.integer :country_call_code

      t.timestamps
    end
  end
end
