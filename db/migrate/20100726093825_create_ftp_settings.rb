class CreateFtpSettings < ActiveRecord::Migration
  def self.up
    create_table :ftp_settings do |t|
      t.string :ftp_server
      t.string :path
      t.string :login
      t.string :password
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ftp_settings
  end
end
