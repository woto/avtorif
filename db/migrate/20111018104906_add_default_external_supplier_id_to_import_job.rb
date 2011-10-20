class AddDefaultExternalSupplierIdToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :default_external_supplier_id, :string
  end

  def self.down
    remove_column :import_jobs, :default_external_supplier_id
  end
end
