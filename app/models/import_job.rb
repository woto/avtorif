class ImportJob < ActiveRecord::Base
  belongs_to :price
  belongs_to :receiveable
end
