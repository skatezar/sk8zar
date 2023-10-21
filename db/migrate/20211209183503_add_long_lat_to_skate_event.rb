class AddLongLatToSkateEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :skateevents, :longitude, :float
    add_column :skateevents, :latitude, :float
  end
end
