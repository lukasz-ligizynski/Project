# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :client_id
      t.integer :ticket_desk_id
      t.integer :seance_id
      t.string :status

      t.timestamps
    end
  end
end
