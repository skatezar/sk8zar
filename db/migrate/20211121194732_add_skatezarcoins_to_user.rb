class AddSkatezarcoinsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :coins_earned, :integer, default: 0
    add_column :users, :coins_expensed, :integer, default: 0
  end
end
