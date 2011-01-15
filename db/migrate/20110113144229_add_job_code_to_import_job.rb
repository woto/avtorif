class AddJobCodeToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :job_code, :string
  end

  def self.down
    remove_column :import_jobs, :job_code
  end
end
