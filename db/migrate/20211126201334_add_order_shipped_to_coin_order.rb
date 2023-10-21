class AddOrderShippedToCoinOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :skatezarcoinorders, :completed, :boolean, default: false
  end
end
