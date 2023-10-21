class AddPointsToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :communitytasks, :coin_reward, :integer
  end
end
