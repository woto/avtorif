class AddMoreFieldsToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :min_order, :string
    add_column :prices, :multiply_factor, :string
    add_column :prices, :unit_package, :string
  end

  def self.down
    remove_column :prices, :unit_package
    remove_column :prices, :multiply_factor
    remove_column :prices, :min_order
  end
end
