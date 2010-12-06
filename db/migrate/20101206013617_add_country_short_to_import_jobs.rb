class AddCountryShortToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :country_short, :string
  end

  def self.down
    remove_column :import_jobs, :country_short
  end
end
