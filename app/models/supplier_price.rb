class SupplierPrice < ActiveRecord::Base
  has_attached_file :attachment
  belongs_to :supplier
  belongs_to :job
end
