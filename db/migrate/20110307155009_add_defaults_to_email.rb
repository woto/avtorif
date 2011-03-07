class AddDefaultsToEmail < ActiveRecord::Migration
  def self.up
    change_table :email_receives do |t|
      t.change_default :server, "mail.avtorif.ru"
      t.change_default :protocol, "pop3"
      t.change_default :port, "110"
    end
  end

  def self.down
  end
end
