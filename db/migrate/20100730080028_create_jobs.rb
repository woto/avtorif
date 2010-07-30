class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.datetime :next_start
      t.datetime :last_start
      t.string :title
      t.references :repeats
      t.references :job
      t.string :jobable_type
      t.integer :jobable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
