class AddDefaultsToHttpReceive < ActiveRecord::Migration
  def self.up
    change_column(:http_receives, :port, :string, :default => '80')    
  end

  def self.down
  end
end
