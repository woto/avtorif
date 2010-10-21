class ChangeJobsVisionPeriods < ActiveRecord::Migration
  def self.up
    change_column(:jobs, :seconds_between_jobs, :integer, :default => 4000)
    change_column(:jobs, :seconds_working, :integer, :default => 20)
  end

  def self.down
  end
end
