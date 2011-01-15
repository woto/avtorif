class AddSupplierIdToPrices < ActiveRecord::Migration
  def self.up
    add_column :prices, :supplier_id, :integer
  end

  def self.down
    remove_column :prices, :supplier_id
  end
end
