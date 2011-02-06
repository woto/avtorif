class AddWebSiteToSupplier < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :web_site, :string
  end

  def self.down
    remove_column :suppliers, :web_site
  end
end
