class CreateFtpSettings < ActiveRecord::Migration
  def self.up
    create_table :ftp_settings do |t|
      t.string :ftp

      t.timestamps
    end
  end

  def self.down
    drop_table :ftp_settings
  end
end
