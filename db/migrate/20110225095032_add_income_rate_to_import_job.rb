class AddIncomeRateToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :income_rate, :float
  end

  def self.down
    remove_column :import_jobs, :income_rate
  end
end
