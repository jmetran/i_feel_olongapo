class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.references :category
      t.references :business

      t.timestamps
    end
    add_index :business_categories, :category_id
    add_index :business_categories, :business_id
  end
end
