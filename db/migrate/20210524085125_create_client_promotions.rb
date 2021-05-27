# frozen_string_literal: true

class CreateClientPromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :client_promotions do |t|
      t.integer :promotions_id
      t.integer :client_id

      t.timestamps
    end
  end
end
