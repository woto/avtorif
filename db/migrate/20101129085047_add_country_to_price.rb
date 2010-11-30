class AddCountryToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :country, :string
  end

  def self.down
    remove_column :prices, :country
  end
end
