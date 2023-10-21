class AddDonationDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :user_id, :integer
    add_column :donations, :title, :string
    add_column :donations, :location, :string
    add_column :donations, :address, :string
    add_column :donations, :description, :string
    add_column :donations, :googlemapslink, :string
    add_column :donations, :time, :string
  end
end
