class AddGroupCodeToSupplierPrices < ActiveRecord::Migration
  def self.up
    add_column :supplier_prices, :group_code, :string
  end

  def self.down
    remove_column :supplier_prices, :group_code
  end
end
