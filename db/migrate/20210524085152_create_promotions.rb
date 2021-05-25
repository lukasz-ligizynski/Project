class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.string :descriptions

      t.timestamps
    end
  end
end
