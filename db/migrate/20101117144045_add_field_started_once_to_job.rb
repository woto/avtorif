class AddFieldStartedOnceToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :started_once, :boolean, :defaul => false
  end

  def self.down
    remove_column :jobs, :started_once
  end
end
