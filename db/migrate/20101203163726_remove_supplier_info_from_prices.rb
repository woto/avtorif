class RemoveSupplierInfoFromPrices < ActiveRecord::Migration
  def self.up
    remove_column(:prices, :inn)
    remove_column(:prices, :kpp)
  end

  def self.down
  end
end
