class AddTitleEnToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :title_en, :string
  end

  def self.down
    remove_column :prices, :title_en
  end
end
