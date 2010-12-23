class AddExternalIdToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :external_id, :string
  end

  def self.down
    remove_column :prices, :external_id
  end
end
