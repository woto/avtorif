class AddEncodingToFtpReceive < ActiveRecord::Migration
  def self.up
    add_column :ftp_receives, :encoding, :string
  end

  def self.down
    remove_column :ftp_receives, :encoding
  end
end
