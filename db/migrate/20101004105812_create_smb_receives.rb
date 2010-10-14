class CreateSmbReceives < ActiveRecord::Migration
  def self.up
    create_table :smb_receives do |t|
      t.string :server
      t.string :share
      t.integer :port, :default => 445
      t.string :path, :default => "/"
      t.string :login, :default => "Гость"
      t.string :password, :default => "Гость"
      t.string :workgroup
      
      t.timestamps
    end
  end

  def self.down
    drop_table :smb_receives
  end
end
