class AddMoreThingsToMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :age_type
    add_column :movies, :adult_only, :boolean
    add_column :movies, :description, :string
  end
end
