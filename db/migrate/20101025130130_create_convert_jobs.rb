class CreateConvertJobs < ActiveRecord::Migration
  def self.up
    create_table :convert_jobs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :convert_jobs
  end
end
