class AddDetailToSkatezarcoinOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :skatezarcoinorders, :firstname, :string
    add_column :skatezarcoinorders, :lastname, :string
    add_column :skatezarcoinorders, :address, :string
    add_column :skatezarcoinorders, :country, :string
    add_column :skatezarcoinorders, :postalcode, :string
    add_column :skatezarcoinorders, :message, :string
    add_column :skatezarcoinorders, :item, :string
  end
end
