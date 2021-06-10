# frozen_string_literal: true

class AddNewIndex < ActiveRecord::Migration[6.1]
  def change
    add_reference :client_promotions, :client, index: true, foreign_key: true
  end
end
