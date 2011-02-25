class RemoveDeliveryDaysAverageFromImportJobs < ActiveRecord::Migration
  def self.up
    remove_column :import_jobs, :delivery_days_average
  end

  def self.down
    add_column :import_jobs, :delivery_days_average, :remove
  end
end
