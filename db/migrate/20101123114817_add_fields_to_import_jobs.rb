class AddFieldsToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :manufacturer_colnum, :integer
    add_column :import_jobs, :catalog_number_colnum, :integer
    add_column :import_jobs, :title_colnum, :integer
    add_column :import_jobs, :count_colnum, :integer
    add_column :import_jobs, :multiplicity_colnum, :integer
    add_column :import_jobs, :income_price_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :income_price_colnum
    remove_column :import_jobs, :multiplicity_colnum
    remove_column :import_jobs, :count_colnum
    remove_column :import_jobs, :title_colnum
    remove_column :import_jobs, :catalog_number_colnum
    remove_column :import_jobs, :manufacturer_colnum
  end
end
