class AddExternalSupplierIdToPriceCostTemplate < ActiveRecord::Migration
  def self.up
    add_column :price_cost_templates, :external_supplier_id, :string
  end

  def self.down
    remove_column :price_cost_templates, :external_supplier_id
  end
end
