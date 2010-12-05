class AddDeliveryDaysToSuppliers < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :delivery_days, :integer
  end

  def self.down
    remove_column :suppliers, :delivery_days
  end
end
