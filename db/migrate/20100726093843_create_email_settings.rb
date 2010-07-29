class CreateEmailSettings < ActiveRecord::Migration
  def self.up
    create_table :email_settings do |t|
      t.string :email_address
      t.string :pop_server
      t.string :login
      t.string :password
      t.string :topic
      t.string :sender_address
      
      t.timestamps
    end
  end

  def self.down
    drop_table :email_settings
  end
end
