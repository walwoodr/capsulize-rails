class CreateClothingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :clothing_items do |t|
      t.string :name
      t.integer :category_id
      t.string :color
      t.integer :fanciness

      t.timestamps
    end
  end
end
