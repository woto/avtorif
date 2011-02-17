class CreatePriceSettings < ActiveRecord::Migration
  def self.up
    create_table :price_settings do |t|
      t.string :title
      t.references :currency_buy
      t.float :absolute_buy_coefficient
      t.float :relative_buy_coefficient
      t.boolean :visible_for_site
      t.boolean :visible_for_stock
      t.boolean :visible_for_shops
      t.float :retail_rate
      t.float :income_rate
      t.float :kilo_price
      t.references :currency_weight
      t.float :relative_weight_coefficient
      t.float :absolute_weight_ccoefficient
      t.boolean :presence
      t.string :delivery_summary
      t.string :country
      t.string :country_short
      t.float :weight_unavaliable_rate
      t.integer :delivery_days_declared
      t.references :price_setting

      t.timestamps
    end
  end

  def self.down
    drop_table :price_settings
  end
end
