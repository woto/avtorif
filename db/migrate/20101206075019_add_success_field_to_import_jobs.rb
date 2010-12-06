class AddSuccessFieldToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :success_percent, :string
  end

  def self.down
    remove_column :import_jobs, :success_percent
  end
end
