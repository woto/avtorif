class ModifyColumnsInPrices < ActiveRecord::Migration
  def self.up
    rename_column(:prices, :result_cost, :income_cost)
    rename_column(:prices, :initial_cost, :price_cost)
    add_column(:prices, :retail_cost, :float)
  end

  def self.down
  end
end
