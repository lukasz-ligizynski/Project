class CreateHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :halls do |t|
      t.integer :row
      t.integer :pleace

      t.timestamps
    end
  end
end
