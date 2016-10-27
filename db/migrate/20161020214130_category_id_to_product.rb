class CategoryIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :categories, index: true
  end
end
