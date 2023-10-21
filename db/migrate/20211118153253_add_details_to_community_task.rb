class AddDetailsToCommunityTask < ActiveRecord::Migration[6.0]
  def change
    add_column :communitytasks, :user_id, :integer
    add_column :communitytasks, :title, :string
    add_column :communitytasks, :description, :string
    add_column :communitytasks, :automatic_verification, :boolean, default: false
    add_column :communitytasks, :verification, :string
  end
end
