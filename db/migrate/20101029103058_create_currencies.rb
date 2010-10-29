class CreateCurrencies < ActiveRecord::Migration
  def self.up
    create_table :currencies do |t|
      t.string :title
      t.string :foreign_id
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :currencies
  end
end
