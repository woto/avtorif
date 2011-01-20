class AddDeliveryDaysDeclaredColnumToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :delivery_days_declared_colnum, :string
  end

  def self.down
    remove_column :import_jobs, :delivery_days_declared_colnum
  end
end
