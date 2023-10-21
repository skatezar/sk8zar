class CreateClaims < ActiveRecord::Migration[6.0]
  def change
    create_table :claims do |t|
      t.text :content
      t.references :communitytask, null: false, foreign_key: true

      t.timestamps
    end
  end
end
