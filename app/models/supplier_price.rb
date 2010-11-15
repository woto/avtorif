class SupplierPrice < ActiveRecord::Base
  has_attached_file :attachment
  belongs_to :supplier
  belongs_to :job
  belongs_to :supplier_price

  cattr_reader :per_page
  @@per_page = 100  
end
