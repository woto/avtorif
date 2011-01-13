class AddManufacturerOrigToPrices < ActiveRecord::Migration
  def self.up
    add_column :prices, :manufacturer_orig, :string
  end

  def self.down
    remove_column :prices, :manufacturer_orig
  end
end
