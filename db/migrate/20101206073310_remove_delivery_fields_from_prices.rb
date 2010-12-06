class RemoveDeliveryFieldsFromPrices < ActiveRecord::Migration
  def self.up
    remove_column(:prices, :delivery_days_declared)
    remove_column(:prices, :delivery_days_average)
  end

  def self.down
  end
end
