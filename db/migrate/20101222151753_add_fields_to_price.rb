class AddFieldsToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :applicability, :string
    add_column :prices, :unit, :string
    add_column :prices, :description, :string
  end

  def self.down
    remove_column :prices, :description
    remove_column :prices, :unit
    remove_column :prices, :applicability
  end
end
