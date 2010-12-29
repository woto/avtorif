class AddArchTypeToUnpackJob < ActiveRecord::Migration
  def self.up
    add_column :unpack_jobs, :archive_type, :string
  end

  def self.down
    remove_column :unpack_jobs, :archive_type
  end
end
