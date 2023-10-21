class AddAddressToSkatespots < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :address, :string
  end
end
