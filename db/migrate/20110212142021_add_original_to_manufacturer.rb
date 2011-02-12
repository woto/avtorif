class AddOriginalToManufacturer < ActiveRecord::Migration
  def self.up
    add_column :manufacturers, :original, :boolean, :default => false
  end

  def self.down
    remove_column :manufacturers, :original
  end
end
