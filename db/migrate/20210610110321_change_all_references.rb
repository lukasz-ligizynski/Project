class ChangeAllReferences < ActiveRecord::Migration[6.1]
  def change
    remove_index :client_promotions, :promotions_id
    remove_column :client_promotions, :promotions_id
    add_reference :client_promotions, :promotion, index: true, foreign_key: true

    remove_index :reservations, :clients_id
    remove_column :reservations, :clients_id
    add_reference :reservations, :client, index: true, foreign_key: true
    
    remove_index :reservations, :seances_id
    remove_column :reservations, :seances_id
    add_reference :reservations, :seance, index: true, foreign_key: true

    remove_index :reservations, :ticket_desks_id
    remove_column :reservations, :ticket_desks_id
    add_reference :reservations, :ticket_desk, index: true, foreign_key: true

    remove_index :seances, :halls_id
    remove_column :seances, :halls_id
    add_reference :seances, :hall, index: true, foreign_key: true
   
    remove_index :seances, :movies_id
    remove_column :seances, :movies_id
    add_reference :seances, :movie, index: true, foreign_key: true

    remove_index :tickets, :reservations_id
    remove_column :tickets, :reservations_id
    add_reference :tickets, :reservations, index: true, foreign_key: true
  end
end
