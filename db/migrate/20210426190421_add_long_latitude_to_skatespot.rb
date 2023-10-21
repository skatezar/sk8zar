class AddLongLatitudeToSkatespot < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :latitude, :float
    add_column :skatespots, :longitude, :float
  end
end
