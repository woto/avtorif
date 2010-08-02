class CreateNotifyJobs < ActiveRecord::Migration
  def self.up
    create_table :notify_jobs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :notify_jobs
  end
end
