class AddPriceSettingIdToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :price_setting_id, :integer
  end

  def self.down
    remove_column :import_jobs, :price_setting_id
  end
end
