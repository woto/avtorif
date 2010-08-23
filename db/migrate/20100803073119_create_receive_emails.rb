class CreateReceiveEmails < ActiveRecord::Migration
  def self.up
    create_table :receive_emails do |t|
      t.string :server
      t.string :port
      #t.string :address
      t.boolean :ssl
      t.string :login
      t.string :password
      t.string :topic
      t.string :sender
      t.string :protocol

      t.timestamps
    end
  end

  def self.down
    drop_table :receive_emails
  end
end