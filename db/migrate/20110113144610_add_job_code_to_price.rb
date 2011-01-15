class AddJobCodeToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :job_code, :string, :limit => 20
  end

  def self.down
    remove_column :prices, :job_code
  end
end
