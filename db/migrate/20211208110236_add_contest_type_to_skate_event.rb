class AddContestTypeToSkateEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :skateevents, :contest_type, :string
  end
end
