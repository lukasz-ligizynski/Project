# frozen_string_literal: true

class ChangeClientPromotions < ActiveRecord::Migration[6.1]
  def change
    remove_column :client_promotions, :promotions_id, :integer
    remove_column :client_promotions, :client_id, :integer

    add_reference :client_promotions, :promotions, foreign_key: true
    add_reference :client_promotions, :clients, foreign_key: true
  end
end
