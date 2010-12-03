class AddDeliveryDatesToPrices < ActiveRecord::Migration
  def self.up
    add_column(:prices, :delivery_days_declared, :string)
    add_column(:prices, :delivery_days_average, :string)
    remove_column(:prices, :estimate_days)
  end

  def self.down
  end
end
