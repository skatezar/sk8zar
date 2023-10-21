class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :brand
      t.integer :price
      t.string :condition
      t.string :size

      t.timestamps
    end
  end
end
