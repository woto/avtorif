class AddDeliveryDaysToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :delivery_days, :string
  end

  def self.down
    remove_column :import_jobs, :delivery_days
  end
end
