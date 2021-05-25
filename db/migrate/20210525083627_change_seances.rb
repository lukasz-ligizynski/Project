class ChangeSeances < ActiveRecord::Migration[6.1]
  def change
    remove_column :seances, :movie_id, :integer
    remove_column :seances, :hall_id, :integer

    add_reference :seances, :movies, foreign_key: true
    add_reference :seances, :halls, foreign_key: true

    remove_column :seances, :date, :date
    add_column :seances, :seance_date, :datetime
  end
end
