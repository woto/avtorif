class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.string :catalog_number
      t.references :manufacturer
      t.boolean :original
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
