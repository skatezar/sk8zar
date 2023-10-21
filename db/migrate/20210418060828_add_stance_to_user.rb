class AddStanceToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stance, :string
  end
end


