class AddMailDeliveredToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :maildelivered, :boolean, default: false
  end
end
