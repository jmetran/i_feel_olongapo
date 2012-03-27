class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :location_type
      t.integer :zip_code
      t.integer :parent_id
      t.string :permalink
      t.string :display_name

      t.timestamps
    end
  end
end