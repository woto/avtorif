class AddMinimalIncomeCostColnumToImportJobs < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :minimal_income_cost_colnum, :integer
  end

  def self.down
    remove_column :import_jobs, :minimal_income_cost_colnum
  end
end
