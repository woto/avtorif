class AddPartsOptions2ToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :new_catalog_number_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :new_catalog_number_colnum
  end
end
