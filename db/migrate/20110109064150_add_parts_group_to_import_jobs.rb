class AddPartsGroupToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :parts_group_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :parts_group_colnum
  end
end
