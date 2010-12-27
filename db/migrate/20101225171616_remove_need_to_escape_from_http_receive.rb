class RemoveNeedToEscapeFromHttpReceive < ActiveRecord::Migration
  def self.up
    remove_column :http_receives, :need_to_escape
  end

  def self.down
    add_column :http_receives, :need_to_escape, :remove
  end
end
