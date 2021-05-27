# frozen_string_literal: true

class AddColumnToHall < ActiveRecord::Migration[6.1]
  def change
    add_column :halls, :hall_number, :integer
  end
end
