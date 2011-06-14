class AddImageUrlColnumToReplaceJobs < ActiveRecord::Migration
  def self.up
    add_column :replace_jobs, :image_url_colnum, :integer
    add_column :replace_jobs, :image_url_prefix, :string
  end

  def self.down
    remove_column :replace_jobs, :image_url_prefix
    remove_column :replace_jobs, :image_url_colnum
  end
end
