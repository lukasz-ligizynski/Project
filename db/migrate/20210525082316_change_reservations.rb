# frozen_string_literal: true

class ChangeReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :movie_id, :integer
    remove_column :reservations, :ticket_desk_id, :integer
    remove_column :reservations, :seance_id, :integer
    remove_column :reservations, :client_id, :integer

    add_reference :reservations, :ticket_desks, foreign_key: true
    add_reference :reservations, :seances, foreign_key: true
    add_reference :reservations, :clients, foreign_key: true
  end
end
