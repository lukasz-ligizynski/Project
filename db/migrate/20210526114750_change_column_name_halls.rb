# frozen_string_literal: true

class ChangeColumnNameHalls < ActiveRecord::Migration[6.1]
  def change
    rename_column :halls, :hall_number, :number
  end
end
