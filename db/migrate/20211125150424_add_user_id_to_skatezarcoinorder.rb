class AddUserIdToSkatezarcoinorder < ActiveRecord::Migration[6.0]
  def change
    add_column :skatezarcoinorders, :user_id, :integer
  end
end
