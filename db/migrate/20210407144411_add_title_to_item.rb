class AddTitleToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :title, :string
  end
end
