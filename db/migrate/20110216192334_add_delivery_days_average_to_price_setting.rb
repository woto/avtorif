class AddDeliveryDaysAverageToPriceSetting < ActiveRecord::Migration
  def self.up
    add_column :price_settings, :delivery_days_average, :integer
  end

  def self.down
    remove_column :price_settings, :delivery_days_average
  end
end
