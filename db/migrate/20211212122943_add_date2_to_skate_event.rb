class AddDate2ToSkateEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :skateevents, :date2, :date
  end
end
