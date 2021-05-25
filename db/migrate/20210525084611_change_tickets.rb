class ChangeTickets < ActiveRecord::Migration[6.1]
  def change
    rename_column :tickets, :type, :ticket_type
    
    remove_column :tickets, :reservation_id, :integer

    add_reference :tickets, :reservations, foreign_key: true

    reversible do |dir|
      change_table :tickets do |t|
        dir.up { t.change :price, :float}
        dir.down { t.change :price, :integer}
      end
    end
  end
end
