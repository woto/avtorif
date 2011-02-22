class RenameColumnsInPriceSettings < ActiveRecord::Migration
  def self.up
    change_table :price_settings do |t|
      t.rename :absolute_buy_coefficient, :absolute_buy_rate
      t.rename :relative_buy_coefficient, :relative_buy_rate
      t.rename :relative_weight_coefficient, :relative_weight_rate
      t.rename :absolute_weight_ccoefficient, :absolute_weight_rate
      t.rename :weight_unavaliable_rate, :weight_unavailable_rate
    end
  end

  def self.down
    change_table :price_settings do |t|
      t.rename :absolute_buy_rate, :absolute_buy_coefficient
      t.rename :relative_buy_rate, :relative_buy_coefficient
      t.rename :relative_weight_rate, :relative_weight_coefficient
      t.rename :absolute_weight_rate, :absolute_weight_ccoefficient
      t.rename :weight_unavailable_rate, :weight_unavaliable_rate
    end
  end
end
