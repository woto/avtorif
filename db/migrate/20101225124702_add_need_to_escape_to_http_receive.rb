class AddNeedToEscapeToHttpReceive < ActiveRecord::Migration
  def self.up
    add_column :http_receives, :need_to_escape, :boolean
  end

  def self.down
    remove_column :http_receives, :need_to_escape
  end
end
