class RemoveJobCodeFromJobs < ActiveRecord::Migration
  def self.up
    remove_column(:jobs, :job_code)
  end

  def self.down
  end
end
