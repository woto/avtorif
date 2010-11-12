class AddFieldsToConvertJob < ActiveRecord::Migration
  def self.up
    add_column :convert_jobs, :encoding, :string
    add_column :convert_jobs, :col_sep, :string
  end

  def self.down
    remove_column :convert_jobs, :col_sep
    remove_column :convert_jobs, :encoding
  end
end
