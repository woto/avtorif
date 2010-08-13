class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      #t.references :job
      t.references :goods
      t.references :supplier
      t.string :title
      t.decimal :cost, :precision => 10, :scale => 3

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
