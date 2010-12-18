class AddExecStringToConvertJobs < ActiveRecord::Migration
  def self.up
    add_column :convert_jobs, :exec_string, :string
  end

  def self.down
    remove_column :convert_jobs, :exec_string
  end
end
