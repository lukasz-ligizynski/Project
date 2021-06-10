class RemoveIndexAdd < ActiveRecord::Migration[6.1]
  def change
    remove_index :client_promotions, :clients_id
    remove_column :client_promotions, :clients_id
  end
end
