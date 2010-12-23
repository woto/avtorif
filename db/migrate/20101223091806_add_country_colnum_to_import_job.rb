class AddCountryColnumToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :country_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :country_colnum
  end
end
