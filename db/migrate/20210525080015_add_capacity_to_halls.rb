class AddCapacityToHalls < ActiveRecord::Migration[6.1]
  def change
    add_column :halls, :capacity, :integer
  end
end
