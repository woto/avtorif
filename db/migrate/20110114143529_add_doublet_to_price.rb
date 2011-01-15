class AddDoubletToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :doublet, :string
  end

  def self.down
    remove_column :prices, :doublet
  end
end
