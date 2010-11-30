class AddManufacturerShortToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :manufacturer_short, :string
  end

  def self.down
    remove_column :prices, :manufacturer_short
  end
end
