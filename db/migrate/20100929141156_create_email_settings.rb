class CreateEmailSettings < ActiveRecord::Migration
  def self.up
    create_table :email_settings do |t|
      t.string :sender
      t.string :topic

      t.timestamps
    end
  end

  def self.down
    drop_table :email_settings
  end
end
