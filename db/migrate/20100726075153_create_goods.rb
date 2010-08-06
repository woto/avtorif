class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.references :price
      t.references :contractor
      t.string :catalog_number
      t.references :manufacturer
      t.boolean :original

      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
