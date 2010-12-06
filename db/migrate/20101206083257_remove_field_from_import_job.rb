class RemoveFieldFromImportJob < ActiveRecord::Migration
  def self.up
    remove_column(:import_jobs, :delivery_days)
  end

  def self.down
  end
end
