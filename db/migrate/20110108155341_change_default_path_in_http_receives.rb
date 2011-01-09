class ChangeDefaultPathInHttpReceives < ActiveRecord::Migration
  def self.up
    change_table :http_receives do |t|
      t.change_default :path, "/"
    end
  end

  def self.down
  end
end
