class AddUserIdToClaim < ActiveRecord::Migration[6.0]
  def change
    add_column :claims, :user_id, :integer
  end
end
