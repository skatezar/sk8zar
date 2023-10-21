class AddGoogleMapsToSkateSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :googlemapslink, :string
  end
end
