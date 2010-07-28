class CreateJobsRepeats < ActiveRecord::Migration
  def self.up
    create_table :jobs_repeats, :id => false do |t|
      t.integer :repeat_id
      t.integer :job_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs_repeats
  end
end
