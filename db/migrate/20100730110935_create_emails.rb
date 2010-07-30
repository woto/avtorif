class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :server
      t.string :address
      t.string :login
      t.string :password
      t.string :topic
      t.string :sender

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
