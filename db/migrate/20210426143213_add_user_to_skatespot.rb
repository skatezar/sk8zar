class AddUserToSkatespot < ActiveRecord::Migration[6.0]
  def change
    add_column :skatespots, :user_id, :integer
  end
end
