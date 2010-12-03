class ModifyColumnsInPrices2 < ActiveRecord::Migration
  def self.up
    remove_column(:prices, :supplier)
  end

  def self.down
  end
end
