class AddImageUrlPrefixToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :image_url_prefix, :string
  end

  def self.down
    remove_column :import_jobs, :image_url_prefix
  end
end
