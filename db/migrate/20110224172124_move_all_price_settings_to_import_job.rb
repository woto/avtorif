class MoveAllPriceSettingsToImportJob < ActiveRecord::Migration
  def self.up
    change_table :import_jobs do |t|
      t.string :title
      t.references :currency_buy
      t.float :absolute_buy_rate
      t.float :relative_buy_rate
      t.boolean :visible_for_site
      t.boolean :visible_for_stock
      t.boolean :visible_for_shops
      t.float :retail_rate
      t.float :kilo_price
      t.references :currency_weight
      t.float :relative_weight_rate
      t.float :absolute_weight_rate
      t.boolean :presence
      t.string :delivery_summary
      t.string :country
      t.string :country_short
      t.float :weight_unavailable_rate
      t.integer :delivery_days_declared
    end
  end

  def self.down
    raise 'Can not'
  end
end
