class ChangeVisionForJobDefaultAgain < ActiveRecord::Migration
  def self.up
    change_column(:jobs, :seconds_between_jobs, :integer, :default => nil)
    change_column(:jobs, :seconds_working, :integer, :default => nil)
  end

  def self.down
  end
end
