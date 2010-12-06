class AddSuccessFieldToPrices < ActiveRecord::Migration
  def self.up
    add_column :prices, :success_percent, :string
  end

  def self.down
    remove_column :prices, :success_percent
  end
end
