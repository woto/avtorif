class AddSupplierIdToPriceSetting < ActiveRecord::Migration
  def self.up
    add_column :price_settings, :supplier_id, :integer
  end

  def self.down
    remove_column :price_settings, :supplier_id
  end
end
