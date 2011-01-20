class RemoveCurrencySellFromImportJob < ActiveRecord::Migration
  def self.up
    remove_column :import_jobs, :currency_sell_id
  end

  def self.down
    add_column :import_jobs, :currency_sell_id, :remove
  end
end
