class AddClaimAwardedBoolean < ActiveRecord::Migration[6.0]
  def change
    add_column :claims, :completed, :boolean, default: false
  end
end
