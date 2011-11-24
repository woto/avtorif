class AddDeliveryDaysDeclaredToPriceImportTemplate < ActiveRecord::Migration
  def self.up
    add_column :price_import_templates, :delivery_days_declared, :integer, :default => 0
  end

  def self.down
    remove_column :price_import_templates, :delivery_days_declared
  end
end
