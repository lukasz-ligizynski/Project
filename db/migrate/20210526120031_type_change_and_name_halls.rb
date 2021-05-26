# frozen_string_literal: true

class TypeChangeAndNameHalls < ActiveRecord::Migration[6.1]
  def change
    rename_column :halls, :number, :name
  end
end
