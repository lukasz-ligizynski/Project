class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :reservation_id
      t.string :seat
      t.string :type
      t.integer :price

      t.timestamps
    end
  end
end
