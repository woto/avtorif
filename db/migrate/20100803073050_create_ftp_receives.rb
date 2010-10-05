class CreateFtpReceives < ActiveRecord::Migration
  def self.up
    create_table :ftp_receives do |t|
      t.string :server, :default => 'avtorif.ru'
      t.string :port, :default => 21
      t.string :path, :default => '/'
      t.string :login
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :ftp_receives
  end
end
