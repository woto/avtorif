class AddFieldsToAttachments < ActiveRecord::Migration
  def self.up
    add_column :attachments, :job_code, :string
  end

  def self.down
    remove_column :attachments, :job_code
  end
end
