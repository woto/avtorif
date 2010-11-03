class ConvertJob < ActiveRecord::Base
  has_many :job, :as => :jobable  
  enum_attr :convert_method, ["Excel - одностраничный (быстрый) - _xls_console_",
    "Excel - многостраничный (медленный) - _xls_roo_",
    "Acceess - _mdb_console_ "
  ]

  validates_presence_of :convert_method

end
