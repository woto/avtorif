class RemoveIncomeCostFromPrices < ActiveRecord::Migration
  def self.up
    remove_column :prices, :income_cost
  end

  def self.down
    add_column :prices, :income_cost, :remove
  end
end
