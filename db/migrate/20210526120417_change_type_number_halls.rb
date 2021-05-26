class ChangeTypeNumberHalls < ActiveRecord::Migration[6.1]
  def change
    
    reversible do |dir|
      change_table :halls do |t|
        dir.up { t.change :name, :string}
        dir.down { t.change :name, :integer}
      end
    end
  end
end
