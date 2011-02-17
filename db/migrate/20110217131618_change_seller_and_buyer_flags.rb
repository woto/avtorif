class ChangeSellerAndBuyerFlags < ActiveRecord::Migration
  def self.up
    change_table :suppliers do |t|
      t.change :buyer, :boolean
      t.change :seller, :boolean
    end
  end

  def self.down
  end
end
