class ChangeDefaultsToYandexInEmailJobs < ActiveRecord::Migration
  def self.up
    change_table :email_receives do |t|
      t.change_default :server, "pop.yandex.ru"
      t.change_default :port, "995"
      t.change_default :protocol, "pop3"
      t.change_default :ssl, "1"
      t.change_default :password, "ASD123qwe"
      t.change_default :login, "priceX@avtorif.ru"
    end
  end

  def self.down
  end
end
