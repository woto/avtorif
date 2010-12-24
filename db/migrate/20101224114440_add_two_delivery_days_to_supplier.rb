class AddTwoDeliveryDaysToSupplier < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :delivery_days_declared, :integer
    add_column :suppliers, :delivery_days_average, :integer
  end

  def self.down
    remove_column :suppliers, :delivery_days_average
    remove_column :suppliers, :delivery_days_declared
  end
end
