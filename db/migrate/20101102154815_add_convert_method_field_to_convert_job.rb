class AddConvertMethodFieldToConvertJob < ActiveRecord::Migration
  def self.up
    add_column :convert_jobs, :convert_method, :string
  end

  def self.down
    remove_column :convert_jobs, :convert_method
  end
end
