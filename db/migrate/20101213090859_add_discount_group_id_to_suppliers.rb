class AddDiscountGroupIdToSuppliers < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :discount_group_id, :integer
  end

  def self.down
    remove_column :suppliers, :discount_group_id
  end
end
