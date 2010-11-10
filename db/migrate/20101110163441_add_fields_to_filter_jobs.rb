class AddFieldsToFilterJobs < ActiveRecord::Migration
  def self.up
    add_column :filter_jobs, :row_sep, :string
    add_column :filter_jobs, :quote_char, :string
    add_column :filter_jobs, :converters, :string
    add_column :filter_jobs, :encoding, :string
    add_column :filter_jobs, :field_size_limit, :string
    add_column :filter_jobs, :unconverted_fields, :string
    add_column :filter_jobs, :headers, :string
    add_column :filter_jobs, :return_headers, :string
    add_column :filter_jobs, :write_headers, :string
    add_column :filter_jobs, :header_converters, :string
    add_column :filter_jobs, :skip_blanks, :string
    add_column :filter_jobs, :force_quotes, :string
  end

  def self.down
    remove_column :filter_jobs, :force_quotes
    remove_column :filter_jobs, :skip_blanks
    remove_column :filter_jobs, :header_converters
    remove_column :filter_jobs, :write_headers
    remove_column :filter_jobs, :return_headers
    remove_column :filter_jobs, :headers
    remove_column :filter_jobs, :unconverted_fields
    remove_column :filter_jobs, :field_size_limit
    remove_column :filter_jobs, :encoding
    remove_column :filter_jobs, :converters
    remove_column :filter_jobs, :quote_char
    remove_column :filter_jobs, :row_sep
  end
end
