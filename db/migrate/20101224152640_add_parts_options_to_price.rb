class AddPartsOptionsToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :new_catalog_number, :string
    add_column :prices, :weight_grams, :float
    add_column :prices, :r0, :string
    add_column :prices, :r1, :string
    add_column :prices, :r2, :string
    add_column :prices, :r3, :string
    add_column :prices, :r4, :string
    add_column :prices, :r5, :string
    add_column :prices, :r6, :string
    add_column :prices, :r7, :string
    add_column :prices, :r8, :string
    add_column :prices, :r9, :string
  end

  def self.down
    remove_column :prices, :r9
    remove_column :prices, :r8
    remove_column :prices, :r7
    remove_column :prices, :r6
    remove_column :prices, :r5
    remove_column :prices, :r4
    remove_column :prices, :r3
    remove_column :prices, :r2
    remove_column :prices, :r1
    remove_column :prices, :r0
    remove_column :prices, :weight_grams
    remove_column :prices, :new_catalog_number
  end
end
