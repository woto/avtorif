class AddWeightColnumToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :weight_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :weight_colnum
  end
end
