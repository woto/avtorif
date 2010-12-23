class AddMoreFieldsToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :min_order_colnum, :integer
    add_column :import_jobs, :multiply_factor_colnum, :integer
    add_column :import_jobs, :unit_package_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :unit_package_colnum
    remove_column :import_jobs, :multiply_factor_colnum
    remove_column :import_jobs, :min_order_colnum
  end
end
