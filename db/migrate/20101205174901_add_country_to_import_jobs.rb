class AddCountryToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :country, :string
  end

  def self.down
    remove_column :import_jobs, :country
  end
end
