class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.string :attachment_file_size
      t.datetime :attachment_updated_at
      t.string :md5
      t.boolean :proceded, :default => false
      t.belongs_to :supplier

      t.timestamps

    end

    add_index(:attachments, [:attachment_file_name, :attachment_file_size, :md5, :supplier_id], :unique => true, :name => 'uniq_attachments')

  end

  def self.down
    drop_table :attachments
  end
end
