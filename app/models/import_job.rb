class ImportJob < ActiveRecord::Base
  enum_attr :encoding, %w(utf8 cp1251 koi8-r cp866), :nil => true
  enum_attr :import_method, ["Очищаем и вставляем - _B_",
    "Вставляем _I_",
    "Имеющиеся в бд и в прайсе обновляем, имеющиеся в прайсе и отсутствующие в бд вставляем - _U_ ",
    "Имеющиеся в бд и в прайсе обновляем, имеющиеся в прайсе и отсутствующие в бд не вставляем - _U0_"
  ], :nil => true
  enum_attr :job_code, ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-ray", "Yankee", "Zulu"], :nil => true

  belongs_to :importable, :polymorphic => true
  has_many :job, :as => :jobable
  has_many :column_relations
  has_many :column_filters
  belongs_to :currency_buy, :class_name => 'Currency'
  #belongs_to :currency_sell, :class_name => 'Currency'
  belongs_to :currency_weight, :class_name => 'Currency'
  belongs_to :delivery_type

  validates_presence_of :import_method
  validates_presence_of :currency_buy
  #validates_presence_of :currency_sell
  #validates_presence_of :currency_weight

  validates_presence_of :income_rate
  validates_presence_of :retail_rate
  validates_presence_of :income_price_colnum
  validates_presence_of :catalog_number_colnum

  validates_numericality_of :retail_rate, :greater_than => 0, :less_than => 1000
  validates_numericality_of :income_rate, :greater_than => 0, :less_than => 1000
  validates_numericality_of :kilo_price, :greater_than_or_equal_to => 0, :less_than => 1000, :allow_nil => true
  validates_numericality_of :weight_unavaliable_rate, :greater_than_or_equal_to => 0, :less_than => 1000, :allow_nil => true

  validates_numericality_of :manufacturer_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :catalog_number_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100
  validates_numericality_of :title_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :count_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :income_price_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100
  validates_numericality_of :external_id_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :weight_grams_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true

end
