class RemoveIncomeRateFromPriceSetting < ActiveRecord::Migration
  def self.up
    remove_column :price_settings, :income_rate
  end

  def self.down
    add_column :price_settings, :income_rate, :remove
  end
end
