class RemoveRetailCostFromPrices < ActiveRecord::Migration
  def self.up
    remove_column :prices, :retail_cost
  end

  def self.down
    add_column :prices, :retail_cost, :remove
  end
end
