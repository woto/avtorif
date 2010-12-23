class AddFieldsToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :default_manufacturer, :string
    add_column :import_jobs, :applicability_colnum, :integer
    add_column :import_jobs, :unit_colnum, :integer
    add_column :import_jobs, :description_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :description_colnum
    remove_column :import_jobs, :unit_colnum
    remove_column :import_jobs, :applicability_colnum
    remove_column :import_jobs, :default_manufacturer
  end
end
