class AddSuccessPercentToPriceSettings < ActiveRecord::Migration
  def self.up
    add_column :price_settings, :success_percent, :integer, :default => 55
  end

  def self.down
    remove_column :price_settings, :success_percent
  end
end
