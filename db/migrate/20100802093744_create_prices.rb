class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.references :job
      t.references :goods
      t.string :description
      t.decimal :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
