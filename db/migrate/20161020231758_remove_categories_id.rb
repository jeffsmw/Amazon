class RemoveCategoriesId < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :categories_id
  end
end
