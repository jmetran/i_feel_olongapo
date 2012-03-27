class AddSlugToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :slug, :string
    add_index :businesses, :slug, :unique => true
    #remove_column :businesses, :permalink
  end
end
