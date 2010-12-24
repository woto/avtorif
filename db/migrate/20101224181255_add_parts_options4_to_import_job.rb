class AddPartsOptions4ToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :absolute_buy_currency, :float
    add_column :import_jobs, :relative_buy_currency, :float
    add_column :import_jobs, :absolute_weight_currency, :float
    add_column :import_jobs, :relative_weight_currency, :float
  end

  def self.down
    remove_column :import_jobs, :relative_weight_currency
    remove_column :import_jobs, :absolute_weight_currency
    remove_column :import_jobs, :relative_buy_currency
    remove_column :import_jobs, :absolute_buy_currency
  end
end
