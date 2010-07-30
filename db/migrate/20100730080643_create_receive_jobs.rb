class CreateReceiveJobs < ActiveRecord::Migration
  def self.up
    create_table :receive_jobs do |t|
      t.references :price

      t.timestamps
    end
  end

  def self.down
    drop_table :receive_jobs
  end
end
