class AddPartsGroupToPrices < ActiveRecord::Migration
  def self.up
    add_column :prices, :parts_group, :string
  end

  def self.down
    remove_column :prices, :parts_group
  end
end
