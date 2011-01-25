class AddJobIdToManufacturer < ActiveRecord::Migration
  def self.up
    add_column :manufacturers, :job_id, :integer
  end

  def self.down
    remove_column :manufacturers, :job_id
  end
end
