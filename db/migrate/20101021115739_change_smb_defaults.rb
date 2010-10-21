class ChangeSmbDefaults < ActiveRecord::Migration
  def self.up
    change_column(:smb_receives, :login, :string, {:default => 'office'})
    change_column(:smb_receives, :password, :string, {:default => '2'})
  end

  def self.down
  end
end
