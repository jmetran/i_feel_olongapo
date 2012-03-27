class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.date :birth_date
      t.references :location

      t.timestamps
    end
    add_index :users, :location_id
  end
end
