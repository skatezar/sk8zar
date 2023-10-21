class CreateCommunitytasks < ActiveRecord::Migration[6.0]
  def change
    create_table :communitytasks do |t|

      t.timestamps
    end
  end
end
