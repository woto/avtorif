class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.string :code
      t.string :title
      t.references :supplier
      t.decimal :margin
      t.boolean :original

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
