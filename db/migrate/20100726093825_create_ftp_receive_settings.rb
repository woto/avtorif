class CreateFtpReceiveSettings < ActiveRecord::Migration
  def self.up
    create_table :ftp_receive_settings do |t|
      t.string :ftp_server
      t.string :path
      t.string :login
      t.string :password
      t.string :file_date_time
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ftp_receive_settings
  end
end
