class AddMinimalRetailRateToPriceSettings < ActiveRecord::Migration
  def self.up
    add_column :price_settings, :minimal_retail_rate_for_price, :float, :default => 1
  end

  def self.down
    remove_column :price_settings, :minimal_retail_rate_for_price
  end
end
