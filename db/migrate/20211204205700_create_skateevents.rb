class CreateSkateevents < ActiveRecord::Migration[6.0]
  def change
    create_table :skateevents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name_title
      t.date :date
      t.string :location
      t.string :address
      t.string :time
      t.string :googlemapslink
      t.string :description
      t.string :contest_or_session

      t.timestamps
    end
  end
end
