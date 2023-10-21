class AddUserToContestsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :contests, :user_id, :integer
  end
end
