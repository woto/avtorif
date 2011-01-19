class AddCatalogNumberAndManufacturerIdxToPrice < ActiveRecord::Migration
  def self.up
    change_table :prices do |t|
      t.change :catalog_number, :string, {:limit => 100}
      t.change :manufacturer, :string, {:limit => 100}
      t.index [:catalog_number, :manufacturer]
    end
  end

  def self.down
    change_table :prices do |t|
      t.remove_index [:catalog_number, :manufacturer]
    end
  end
end
