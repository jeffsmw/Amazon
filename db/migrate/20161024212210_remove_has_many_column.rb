class RemoveHasManyColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :has_many_reviews
    remove_column :users, :has_many_products
  end
end
