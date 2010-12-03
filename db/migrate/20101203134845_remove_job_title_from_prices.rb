class RemoveJobTitleFromPrices < ActiveRecord::Migration
  def self.up
    remove_column :prices, :job_title
  end

  def self.down
  end
end
