class CreateDonationregs < ActiveRecord::Migration[6.0]
  def change
    create_table :donationregs do |t|
      t.text :content
      t.references :donation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
