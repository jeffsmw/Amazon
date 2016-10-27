class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :stars

      t.timestamps
    end
  end
end
