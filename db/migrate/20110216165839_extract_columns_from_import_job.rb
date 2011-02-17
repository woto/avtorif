class ExtractColumnsFromImportJob < ActiveRecord::Migration
  def self.up
    change_table :import_jobs do |t|
      t.remove :currency_buy_id
      t.remove :job_code
      t.remove :presence
      t.remove :visible_for_site
      t.remove :visible_for_stock
      t.remove :visible_for_shops
      t.remove :delivery_days_declared
      t.remove :country
      t.remove :country_short
      t.remove :delivery_summary
      t.remove :income_rate
      t.remove :retail_rate
      t.remove :kilo_price
      t.remove :currency_weight_id
      t.remove :weight_unavaliable_rate
    end
  end

  def self.down
  end
end
