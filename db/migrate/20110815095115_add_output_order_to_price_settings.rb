class AddOutputOrderToPriceSettings < ActiveRecord::Migration
  def self.up
    add_column :price_settings, :output_order, :integer
  end

  def self.down
    remove_column :price_settings, :output_order
  end
end
