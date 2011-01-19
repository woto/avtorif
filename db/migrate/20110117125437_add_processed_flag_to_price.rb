class AddProcessedFlagToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :processed, :boolean, {:default => 0}
  end

  def self.down
    remove_column :prices, :processed
  end
end
