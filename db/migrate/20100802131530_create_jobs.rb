class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.datetime :next_start
      t.datetime :last_start
      t.datetime :last_finish
      t.integer :interval_between_jobs
      t.integer :interval_working
      t.string :title
      t.references :job
      t.references :jobable, :polymorphic => true
      t.references :supplier
      t.string :file_mask, :default => '".*"'
      t.boolean :locked, :default => false
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
