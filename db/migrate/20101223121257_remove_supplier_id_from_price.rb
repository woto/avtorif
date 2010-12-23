class RemoveSupplierIdFromPrice < ActiveRecord::Migration
  def self.up
    remove_column :prices, :supplier_id
  end

  def self.down
  end
end
