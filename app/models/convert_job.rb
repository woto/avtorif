class ConvertJob < ActiveRecord::Base
  has_many :jobs, :as => :jobable  
  enum_attr :convert_method, [
    "xls _pyExcelerator_",
    "xls _xlrd_",
    "xlsx - _dilshod_temirkhodjaev_xlsx2csv_",
    "mdb - _mdb_console_ ",
    'console - _arbitrary_console_'
  ], :nil => true

  enum_attr :col_sep, [
    '\t',
    ',',
    ';',
    ' '
  ], :nil=>true

  enum_attr :encoding_in, [
    'CP1251',
    'CP1252',
    'KOI8-R',
    'CP866',
    'UTF-8',
    'UTF-16LE',
    'UCS-2LE',
    'AUTO'
  ], :nil => true

  enum_attr :encoding_out, [
    'CP1251',
    'CP1252',
    'KOI8-R',
    'CP866',
    'UTF-8',
    'UTF-16LE',
    'UCS-2LE',    
    'AUTO'
  ], :nil => true

  validates_presence_of :convert_method

end
