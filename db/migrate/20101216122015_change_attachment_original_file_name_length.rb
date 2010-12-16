class ChangeAttachmentOriginalFileNameLength < ActiveRecord::Migration
  def self.up
    change_table :supplier_prices do |t|
      t.change :attachment_file_name, :string, :limit => 255
    end
  end

  def self.down
  end
end
