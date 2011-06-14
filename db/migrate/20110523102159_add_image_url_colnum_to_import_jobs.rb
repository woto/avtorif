class AddImageUrlColnumToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :image_url_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :image_url_colnum
  end
end
