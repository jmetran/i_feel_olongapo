class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, :null => false
      t.string :trade_name
      t.string :email
      t.string :website
      t.string :description
      t.string :logo
      t.string :tagline
      t.string :showcase_url
      t.string :hotline_number
      t.string :status, :null => false
      t.string :permalink, :null => false
      t.decimal :longitude
      t.decimal :latitude
      t.timestamp :activation_date
      t.string :unit_no
      t.string :building_name
      t.string :street_name
      t.string :village
      t.integer :encoder_id, :null => false
      t.references :location, :null => false
      t.timestamps
    end

    add_index :businesses, :location_id
  end
end