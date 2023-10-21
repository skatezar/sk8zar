class AddSkateEventDetails2 < ActiveRecord::Migration[6.0]
  def change
    add_column :skateevents, :fblink, :string
    add_column :skateevents, :youtubelink, :string
    add_column :skateevents, :sponsors, :string
  end
end
