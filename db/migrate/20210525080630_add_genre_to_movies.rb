# frozen_string_literal: true

class AddGenreToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :genre, :string

    reversible do |dir|
      change_table :movies do |t|
        dir.up { t.change :duration, :float }
        dir.down { t.change :duration, :integer }
      end
    end
  end
end
