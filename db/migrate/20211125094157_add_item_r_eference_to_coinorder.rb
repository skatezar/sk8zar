class AddItemREferenceToCoinorder < ActiveRecord::Migration[6.0]
  def change
    add_column :skatezarcoinorders, :item_id, :integer
  end
end
