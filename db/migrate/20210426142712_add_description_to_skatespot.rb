class AddDescriptionToSkatespot < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :description, :string
  end
end
