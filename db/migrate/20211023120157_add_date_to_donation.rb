class AddDateToDonation < ActiveRecord::Migration[6.0]
  def change
       add_column :donations, :date, :string
  end
end
