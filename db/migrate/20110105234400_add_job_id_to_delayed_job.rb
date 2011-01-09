class AddJobIdToDelayedJob < ActiveRecord::Migration
  def self.up
    change_table :delayed_jobs do |t|
      t.belongs_to :job
    end
  end

  def self.down
    change_table :delayed_jobs do |t|
      t.remove_belongs_to :job
    end
  end
end
