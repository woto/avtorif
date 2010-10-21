class AddJobIdToAttachments < ActiveRecord::Migration
  def self.up
    add_column :attachments, :job_id, :integer
  end

  def self.down
    remove_column :attachments, :job_id
  end
end
