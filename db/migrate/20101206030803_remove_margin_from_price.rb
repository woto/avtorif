class RemoveMarginFromPrice < ActiveRecord::Migration
  def self.up
    remove_column(:prices, :margin)
  end

  def self.down
  end
end
