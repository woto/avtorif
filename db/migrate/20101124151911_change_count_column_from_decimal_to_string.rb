class ChangeCountColumnFromDecimalToString < ActiveRecord::Migration
  def self.up
    change_column(:prices, :count, :string)
  end

  def self.down
  end
end
