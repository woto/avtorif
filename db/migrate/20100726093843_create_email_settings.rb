class CreateEmailSettings < ActiveRecord::Migration
  def self.up
    create_table :email_settings do |t|
      t.string :email
      t.string :pop

      t.timestamps
    end
  end

  def self.down
    drop_table :email_settings
  end
end
