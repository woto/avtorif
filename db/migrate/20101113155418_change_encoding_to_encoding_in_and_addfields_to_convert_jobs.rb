class ChangeEncodingToEncodingInAndAddfieldsToConvertJobs < ActiveRecord::Migration
  def self.up
    add_column(:convert_jobs, :encoding_out, :string, :defult => "UTF-8")
    rename_column(:convert_jobs, :encoding, :encoding_in)
  end

  def self.down
  end
end
