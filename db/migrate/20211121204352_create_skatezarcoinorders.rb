class CreateSkatezarcoinorders < ActiveRecord::Migration[6.0]
  def change
    create_table :skatezarcoinorders do |t|

      t.timestamps
    end
  end
end
