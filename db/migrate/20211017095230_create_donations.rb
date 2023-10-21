class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|

      t.timestamps
    end
  end
end
