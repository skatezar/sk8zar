class AddInstaVideoLinkToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :instavideolink, :string
  end
end
