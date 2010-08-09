class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :price_file_name
      t.string :price_content_type
      t.string :price_file_size
      t.datetime :price_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
