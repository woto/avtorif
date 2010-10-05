class CreateSmbReceives < ActiveRecord::Migration
  def self.up
    create_table :smb_receives do |t|
      t.string :server
      t.string :path
      t.string :login
      t.string :password
      t.string :workgroup
      
      t.timestamps
    end
  end

  def self.down
    drop_table :smb_receives
  end
end
