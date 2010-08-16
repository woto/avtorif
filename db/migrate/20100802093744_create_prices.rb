class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.references :job
      t.references :goods
      t.string :supplier
      t.string :title
      t.decimal :count
      t.decimal :initial_cost, :precision => 10, :scale => 3
      t.decimal :result_cost, :precision => 10, :scale => 3
      t.decimal :margin, :precision => 10, :scale => 3
      t.string :manufacturer
      t.string :catalog_number
      t.string :import_rule

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
