# encoding: utf-8

class SupplierPrice < ActiveRecord::Base
  has_attached_file :attachment
  #  :path => "#{Rails.root}/public/system/:id/:normalized_basename_:style"
  belongs_to :supplier
  belongs_to :job

  cattr_reader :per_page
  @@per_page = 100  
end
