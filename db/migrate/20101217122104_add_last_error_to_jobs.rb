class AddLastErrorToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :last_error, :string
  end

  def self.down
    remove_column :jobs, :last_error
  end
end
