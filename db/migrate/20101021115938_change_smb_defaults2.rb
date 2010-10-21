class ChangeSmbDefaults2 < ActiveRecord::Migration
  def self.up
    change_column(:smb_receives, :server, :string, {:default => 'rif2010'})
  end

  def self.down
  end
end
