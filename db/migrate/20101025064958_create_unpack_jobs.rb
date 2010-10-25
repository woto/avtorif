class CreateUnpackJobs < ActiveRecord::Migration
  def self.up
    create_table :unpack_jobs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :unpack_jobs
  end
end
