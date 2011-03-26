class IncreaseScaleOfRetailRatePriceSettings < ActiveRecord::Migration
  def self.up
    change_table :price_settings do |t|
      t.change :retail_rate, :decimal, :precision => 20, :scale => 10
    end
  end

  def self.down
  end
end
