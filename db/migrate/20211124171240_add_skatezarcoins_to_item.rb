class AddSkatezarcoinsToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :skatezarcoins, :integer, default: 0
  end
end
