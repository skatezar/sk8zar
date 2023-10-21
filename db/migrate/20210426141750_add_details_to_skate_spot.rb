class AddDetailsToSkateSpot < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :location, :string
    add_column :skatespots, :type_of_spot, :string
  end
end
