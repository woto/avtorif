class AddDiscountRateForPriceToPriceSettings < ActiveRecord::Migration
  def self.up
    add_column :price_settings, :discount_rate_for_price, :float, :default => 1
  end

  def self.down
    remove_column :price_settings, :discount_rate_for_price
  end
end
