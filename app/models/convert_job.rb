class ConvertJob < ActiveRecord::Base
  has_many :job, :as => :jobable  
  enum_attr :convert_method, [
    "Excel - одностраничный (быстрый) - _xls_console_",
    "Excel - многостраничный (медленный) - _xls_roo_",
    "Excel - многостраничный (быстрее) - _python_xls2csv_",
    "Excel 2007 - _dilshod_temirkhodjaev_xlsx2csv_",
    "Acceess - _mdb_console_ ",
    'Замена одиночного \n на \r\n - _csv_normalize_new_line_',
    'Просто перекодировка _csv_encode_',
    'Выполнение произвольной коносольной команды _arbitrary_console_'
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
