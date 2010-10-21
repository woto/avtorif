class RenameAttachmentTable < ActiveRecord::Migration
  def self.up
    rename_table :attachments, :supplier_prices
  end

  def self.down
    rename_table :supplier_prices, :attachments
  end
end
