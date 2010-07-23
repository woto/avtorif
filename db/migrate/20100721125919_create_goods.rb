class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.references :price
      t.references :contractor
      t.string :code
      t.references :manufacturer
      t.decimal :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
