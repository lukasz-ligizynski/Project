# frozen_string_literal: true

class CreateSeances < ActiveRecord::Migration[6.1]
  def change
    create_table :seances do |t|
      t.integer :movie_id
      t.integer :hall_id
      t.integer :duration
      t.date :date

      t.timestamps
    end
  end
end
