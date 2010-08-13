class CreateReceiveFtps < ActiveRecord::Migration
  def self.up
    create_table :receive_ftps do |t|
      t.string :server
      t.string :port      
      t.string :path
      t.string :login
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :receive_ftps
  end
end