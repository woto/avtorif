class AddDeliveryFieldsToSupplier < ActiveRecord::Migration
  def self.up
    add_column(:import_jobs, :delivery_days_declared, :integer)
    add_column(:import_jobs, :delivery_days_average, :integer)
  end

  def self.down
  end
end
