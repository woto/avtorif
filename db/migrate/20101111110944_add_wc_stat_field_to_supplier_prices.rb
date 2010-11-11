class AddWcStatFieldToSupplierPrices < ActiveRecord::Migration
  def self.up
    add_column :supplier_prices, :wc_stat, :string
  end

  def self.down
    remove_column :supplier_prices, :wc_stat
  end
end
