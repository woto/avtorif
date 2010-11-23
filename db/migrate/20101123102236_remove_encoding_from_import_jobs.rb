class RemoveEncodingFromImportJobs < ActiveRecord::Migration
  def self.up
    remove_column :import_jobs, :encoding
  end

  def self.down
  end
end
