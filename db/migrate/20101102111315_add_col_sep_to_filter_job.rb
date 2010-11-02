class AddColSepToFilterJob < ActiveRecord::Migration
  def self.up
    add_column :filter_jobs, :col_sep, :string
  end

  def self.down
    remove_column :filter_jobs, :col_sep
  end
end
