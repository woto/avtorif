class RemoveUnnecessaryFieldsFromImportJob < ActiveRecord::Migration
  def self.up
    change_table :import_jobs do |t|
      t.remove :title 
      t.remove :currency_buy_id
      t.remove :absolute_buy_rate 
      t.remove :relative_buy_rate
      t.remove :visible_for_site
      t.remove :visible_for_stock 
      t.remove :visible_for_shops 
      t.remove :retail_rate 
      t.remove :kilo_price 
      t.remove :currency_weight_id
      t.remove :relative_weight_rate 
      t.remove :absolute_weight_rate 
      t.remove :presence 
      t.remove :delivery_summary 
      t.remove :country 
      t.remove :country_short 
      t.remove :weight_unavailable_rate 
      t.remove :delivery_days_declared 
    end
  end

  def self.down
    raise 'Can not'
  end
end
