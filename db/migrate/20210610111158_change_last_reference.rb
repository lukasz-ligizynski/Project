# frozen_string_literal: true

class ChangeLastReference < ActiveRecord::Migration[6.1]
  def change
    remove_index :tickets, :reservations_id
    remove_column :tickets, :reservations_id
    add_reference :tickets, :reservation, index: true, foreign_key: true
  end
end
