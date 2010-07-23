class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.string :code
      t.references :contractor
      t.decimal :margin

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
