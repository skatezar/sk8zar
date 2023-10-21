class AddDbLinkItemToUser < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :users
  end
end
