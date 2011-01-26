# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110125130853) do

  create_table "analogues", :force => true do |t|
    t.integer  "original_id"
    t.integer  "analogue_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auto_options", :force => true do |t|
    t.integer  "auto_id"
    t.integer  "period_id"
    t.integer  "transmission_id"
    t.integer  "gear_id"
    t.integer  "fuel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autos", :force => true do |t|
    t.integer  "manufacturer_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "column_relations", :force => true do |t|
    t.integer  "catalog_number"
    t.integer  "manufacturer"
    t.integer  "cost"
    t.integer  "title"
    t.integer  "weight"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convert_jobs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "convert_method"
    t.string   "encoding_in"
    t.string   "col_sep"
    t.string   "encoding_out"
    t.string   "exec_string"
  end

  create_table "crawler_receives", :force => true do |t|
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", :force => true do |t|
    t.string   "title"
    t.string   "foreign_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "delivery_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discount_groups", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discount_rules", :force => true do |t|
    t.integer  "job_id"
    t.boolean  "buy_sell"
    t.float    "rate"
    t.integer  "discount_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_receives", :force => true do |t|
    t.string   "server"
    t.string   "port"
    t.boolean  "ssl"
    t.string   "login"
    t.string   "password"
    t.string   "protocol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_settings", :force => true do |t|
    t.string   "sender"
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filter_jobs", :force => true do |t|
    t.string   "first"
    t.string   "second"
    t.string   "third"
    t.string   "fourth"
    t.string   "fifth"
    t.string   "sixth"
    t.string   "seventh"
    t.string   "eighth"
    t.string   "ninth"
    t.string   "tenth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "col_sep"
    t.string   "row_sep"
    t.string   "quote_char"
    t.string   "converters"
    t.string   "encoding"
    t.string   "field_size_limit"
    t.string   "unconverted_fields"
    t.string   "headers"
    t.string   "return_headers"
    t.string   "write_headers"
    t.string   "header_converters"
    t.string   "skip_blanks"
    t.string   "force_quotes"
  end

  create_table "folder_receives", :force => true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ftp_receives", :force => true do |t|
    t.string   "server",     :default => "ftp.avtorif.ru"
    t.integer  "port",       :default => 21
    t.string   "path",       :default => "/"
    t.string   "login",      :default => "anonymous"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encoding"
  end

  create_table "fuels", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gears", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", :force => true do |t|
    t.string   "catalog_number"
    t.integer  "manufacturer_id"
    t.boolean  "original"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_auto_options", :force => true do |t|
    t.integer  "goods_id"
    t.integer  "auto_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "http_receives", :force => true do |t|
    t.string   "server"
    t.string   "port",       :default => "80"
    t.string   "path",       :default => "/"
    t.string   "login"
    t.string   "password"
    t.boolean  "ssl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encoding"
  end

  create_table "import_jobs", :force => true do |t|
    t.integer  "importable_id"
    t.string   "importable_type"
    t.string   "import_method"
    t.boolean  "presence"
    t.integer  "currency_buy_id"
    t.integer  "currency_weight_id"
    t.integer  "delivery_type_id"
    t.boolean  "visible_for_site"
    t.boolean  "visible_for_stock"
    t.boolean  "visible_for_shops"
    t.integer  "estimate_days"
    t.float    "retail_rate"
    t.float    "income_rate"
    t.float    "kilo_price"
    t.float    "weight_unavaliable_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manufacturer_colnum"
    t.integer  "catalog_number_colnum"
    t.integer  "title_colnum"
    t.integer  "count_colnum"
    t.integer  "multiplicity_colnum"
    t.integer  "income_price_colnum"
    t.integer  "external_id_colnum"
    t.integer  "weight_colnum"
    t.string   "country"
    t.string   "country_short"
    t.string   "delivery_summary"
    t.integer  "delivery_days_declared"
    t.integer  "delivery_days_average"
    t.string   "success_percent"
    t.string   "default_manufacturer"
    t.integer  "applicability_colnum"
    t.integer  "unit_colnum"
    t.integer  "description_colnum"
    t.integer  "min_order_colnum"
    t.integer  "multiply_factor_colnum"
    t.integer  "unit_package_colnum"
    t.integer  "title_en_colnum"
    t.integer  "country_colnum"
    t.integer  "replacement_colnum"
    t.string   "replacement_delimiter"
    t.float    "weight_koefficient"
    t.integer  "new_catalog_number_colnum"
    t.float    "absolute_buy_currency"
    t.float    "relative_buy_currency"
    t.float    "absolute_weight_currency"
    t.float    "relative_weight_currency"
    t.integer  "parts_group_colnum"
    t.string   "job_code"
    t.string   "delivery_days_declared_colnum"
    t.integer  "replacement_1_colnum"
    t.integer  "replacement_manufacturer_1_colnum"
    t.string   "replacement_default_manufacturer_1",     :limit => 50
    t.integer  "replacement_direction_1"
    t.integer  "replacement_2_colnum"
    t.integer  "replacement_manufacturer_2_colnum"
    t.string   "replacement_default_manufacturer_2",     :limit => 50
    t.integer  "replacement_direction_2"
    t.integer  "replacement_3_colnum"
    t.integer  "replacement_manufacturer_3_colnum"
    t.string   "replacement_default_manufacturer_3",     :limit => 50
    t.integer  "replacement_direction_3"
    t.integer  "replacement_4_colnum"
    t.integer  "replacement_manufacturer_4_colnum"
    t.string   "replacement_default_manufacturer_4",     :limit => 50
    t.integer  "replacement_direction_4"
    t.integer  "replacement_5_colnum"
    t.integer  "replacement_manufacturer_5_colnum"
    t.string   "replacement_default_manufacturer_5",     :limit => 50
    t.integer  "replacement_direction_5"
    t.integer  "replacement_6_colnum"
    t.integer  "replacement_manufacturer_6_colnum"
    t.string   "replacement_default_manufacturer_6",     :limit => 50
    t.integer  "replacement_direction_6"
    t.integer  "replacement_7_colnum"
    t.integer  "replacement_manufacturer_7_colnum"
    t.string   "replacement_default_manufacturer_7",     :limit => 50
    t.integer  "replacement_direction_7"
    t.integer  "replacement_8_colnum"
    t.integer  "replacement_manufacturer_8_colnum"
    t.string   "replacement_default_manufacturer_8",     :limit => 50
    t.integer  "replacement_direction_8"
    t.integer  "replacement_9_colnum"
    t.integer  "replacement_manufacturer_9_colnum"
    t.string   "replacement_default_manufacturer_9",     :limit => 50
    t.integer  "replacement_direction_9"
    t.integer  "replacement_10_colnum"
    t.integer  "replacement_manufacturer_10_colnum"
    t.string   "replacement_default_manufacturer_10",    :limit => 50
    t.integer  "replacement_direction_10"
    t.integer  "replacement_11_colnum"
    t.integer  "replacement_manufacturer_11_colnum"
    t.string   "replacement_default_manufacturer_11",    :limit => 50
    t.integer  "replacement_direction_11"
    t.integer  "replacement_12_colnum"
    t.integer  "replacement_manufacturer_12_colnum"
    t.string   "replacement_default_manufacturer_12",    :limit => 50
    t.integer  "replacement_direction_12"
    t.integer  "replacement_13_colnum"
    t.integer  "replacement_manufacturer_13_colnum"
    t.string   "replacement_default_manufacturer_13",    :limit => 50
    t.integer  "replacement_direction_13"
    t.integer  "replacement_14_colnum"
    t.integer  "replacement_manufacturer_14_colnum"
    t.string   "replacement_default_manufacturer_14",    :limit => 50
    t.integer  "replacement_direction_14"
    t.integer  "replacement_15_colnum"
    t.integer  "replacement_manufacturer_15_colnum"
    t.string   "replacement_default_manufacturer_15",    :limit => 50
    t.integer  "replacement_direction_15"
    t.integer  "replacement_16_colnum"
    t.integer  "replacement_manufacturer_16_colnum"
    t.string   "replacement_default_manufacturer_16",    :limit => 50
    t.integer  "replacement_direction_16"
    t.integer  "replacement_17_colnum"
    t.integer  "replacement_manufacturer_17_colnum"
    t.string   "replacement_default_manufacturer_17",    :limit => 50
    t.integer  "replacement_direction_17"
    t.integer  "replacement_18_colnum"
    t.integer  "replacement_manufacturer_18_colnum"
    t.string   "replacement_default_manufacturer_18",    :limit => 50
    t.integer  "replacement_direction_18"
    t.integer  "replacement_19_colnum"
    t.integer  "replacement_manufacturer_19_colnum"
    t.string   "replacement_default_manufacturer_19",    :limit => 50
    t.integer  "replacement_direction_19"
    t.integer  "replacement_20_colnum"
    t.integer  "replacement_manufacturer_20_colnum"
    t.string   "replacement_default_manufacturer_20",    :limit => 50
    t.integer  "replacement_direction_20"
    t.integer  "replacement_21_colnum"
    t.integer  "replacement_manufacturer_21_colnum"
    t.string   "replacement_default_manufacturer_21",    :limit => 50
    t.integer  "replacement_direction_21"
    t.integer  "replacement_22_colnum"
    t.integer  "replacement_manufacturer_22_colnum"
    t.string   "replacement_default_manufacturer_22",    :limit => 50
    t.integer  "replacement_direction_22"
    t.integer  "replacement_23_colnum"
    t.integer  "replacement_manufacturer_23_colnum"
    t.string   "replacement_default_manufacturer_23",    :limit => 50
    t.integer  "replacement_direction_23"
    t.integer  "replacement_24_colnum"
    t.integer  "replacement_manufacturer_24_colnum"
    t.string   "replacement_default_manufacturer_24",    :limit => 50
    t.integer  "replacement_direction_24"
    t.integer  "replacement_25_colnum"
    t.integer  "replacement_manufacturer_25_colnum"
    t.string   "replacement_default_manufacturer_25",    :limit => 50
    t.integer  "replacement_direction_25"
    t.integer  "replacement_26_colnum"
    t.integer  "replacement_manufacturer_26_colnum"
    t.string   "replacement_default_manufacturer_26",    :limit => 50
    t.integer  "replacement_direction_26"
    t.integer  "replacement_27_colnum"
    t.integer  "replacement_manufacturer_27_colnum"
    t.string   "replacement_default_manufacturer_27",    :limit => 50
    t.integer  "replacement_direction_27"
    t.integer  "replacement_28_colnum"
    t.integer  "replacement_manufacturer_28_colnum"
    t.string   "replacement_default_manufacturer_28",    :limit => 50
    t.integer  "replacement_direction_28"
    t.integer  "replacement_29_colnum"
    t.integer  "replacement_manufacturer_29_colnum"
    t.string   "replacement_default_manufacturer_29",    :limit => 50
    t.integer  "replacement_direction_29"
    t.integer  "replacement_30_colnum"
    t.integer  "replacement_manufacturer_30_colnum"
    t.string   "replacement_default_manufacturer_30",    :limit => 50
    t.integer  "replacement_direction_30"
    t.integer  "replacement_31_colnum"
    t.integer  "replacement_manufacturer_31_colnum"
    t.string   "replacement_default_manufacturer_31",    :limit => 50
    t.integer  "replacement_direction_31"
    t.integer  "replacement_32_colnum"
    t.integer  "replacement_manufacturer_32_colnum"
    t.string   "replacement_default_manufacturer_32",    :limit => 50
    t.integer  "replacement_direction_32"
    t.integer  "replacement_33_colnum"
    t.integer  "replacement_manufacturer_33_colnum"
    t.string   "replacement_default_manufacturer_33",    :limit => 50
    t.integer  "replacement_direction_33"
    t.integer  "replacement_34_colnum"
    t.integer  "replacement_manufacturer_34_colnum"
    t.string   "replacement_default_manufacturer_34",    :limit => 50
    t.integer  "replacement_direction_34"
    t.integer  "replacement_35_colnum"
    t.integer  "replacement_manufacturer_35_colnum"
    t.string   "replacement_default_manufacturer_35",    :limit => 50
    t.integer  "replacement_direction_35"
    t.integer  "replacement_36_colnum"
    t.integer  "replacement_manufacturer_36_colnum"
    t.string   "replacement_default_manufacturer_36",    :limit => 50
    t.integer  "replacement_direction_36"
    t.integer  "replacement_37_colnum"
    t.integer  "replacement_manufacturer_37_colnum"
    t.string   "replacement_default_manufacturer_37",    :limit => 50
    t.integer  "replacement_direction_37"
    t.integer  "replacement_38_colnum"
    t.integer  "replacement_manufacturer_38_colnum"
    t.string   "replacement_default_manufacturer_38",    :limit => 50
    t.integer  "replacement_direction_38"
    t.integer  "replacement_39_colnum"
    t.integer  "replacement_manufacturer_39_colnum"
    t.string   "replacement_default_manufacturer_39",    :limit => 50
    t.integer  "replacement_direction_39"
    t.integer  "replacement_40_colnum"
    t.integer  "replacement_manufacturer_40_colnum"
    t.string   "replacement_default_manufacturer_40",    :limit => 50
    t.integer  "replacement_direction_40"
    t.integer  "replacement_41_colnum"
    t.integer  "replacement_manufacturer_41_colnum"
    t.string   "replacement_default_manufacturer_41",    :limit => 50
    t.integer  "replacement_direction_41"
    t.integer  "replacement_42_colnum"
    t.integer  "replacement_manufacturer_42_colnum"
    t.string   "replacement_default_manufacturer_42",    :limit => 50
    t.integer  "replacement_direction_42"
    t.integer  "replacement_43_colnum"
    t.integer  "replacement_manufacturer_43_colnum"
    t.string   "replacement_default_manufacturer_43",    :limit => 50
    t.integer  "replacement_direction_43"
    t.integer  "replacement_44_colnum"
    t.integer  "replacement_manufacturer_44_colnum"
    t.string   "replacement_default_manufacturer_44",    :limit => 50
    t.integer  "replacement_direction_44"
    t.integer  "replacement_45_colnum"
    t.integer  "replacement_manufacturer_45_colnum"
    t.string   "replacement_default_manufacturer_45",    :limit => 50
    t.integer  "replacement_direction_45"
    t.integer  "replacement_46_colnum"
    t.integer  "replacement_manufacturer_46_colnum"
    t.string   "replacement_default_manufacturer_46",    :limit => 50
    t.integer  "replacement_direction_46"
    t.integer  "replacement_47_colnum"
    t.integer  "replacement_manufacturer_47_colnum"
    t.string   "replacement_default_manufacturer_47",    :limit => 50
    t.integer  "replacement_direction_47"
    t.integer  "replacement_48_colnum"
    t.integer  "replacement_manufacturer_48_colnum"
    t.string   "replacement_default_manufacturer_48",    :limit => 50
    t.integer  "replacement_direction_48"
    t.integer  "replacement_49_colnum"
    t.integer  "replacement_manufacturer_49_colnum"
    t.string   "replacement_default_manufacturer_49",    :limit => 50
    t.integer  "replacement_direction_49"
    t.integer  "replacement_50_colnum"
    t.integer  "replacement_manufacturer_50_colnum"
    t.string   "replacement_default_manufacturer_50",    :limit => 50
    t.integer  "replacement_direction_50"
    t.integer  "replacement_51_colnum"
    t.integer  "replacement_manufacturer_51_colnum"
    t.string   "replacement_default_manufacturer_51",    :limit => 50
    t.integer  "replacement_direction_51"
    t.integer  "replacement_52_colnum"
    t.integer  "replacement_manufacturer_52_colnum"
    t.string   "replacement_default_manufacturer_52",    :limit => 50
    t.integer  "replacement_direction_52"
    t.integer  "replacement_53_colnum"
    t.integer  "replacement_manufacturer_53_colnum"
    t.string   "replacement_default_manufacturer_53",    :limit => 50
    t.integer  "replacement_direction_53"
    t.integer  "replacement_54_colnum"
    t.integer  "replacement_manufacturer_54_colnum"
    t.string   "replacement_default_manufacturer_54",    :limit => 50
    t.integer  "replacement_direction_54"
    t.integer  "replacement_55_colnum"
    t.integer  "replacement_manufacturer_55_colnum"
    t.string   "replacement_default_manufacturer_55",    :limit => 50
    t.integer  "replacement_direction_55"
    t.integer  "replacement_56_colnum"
    t.integer  "replacement_manufacturer_56_colnum"
    t.string   "replacement_default_manufacturer_56",    :limit => 50
    t.integer  "replacement_direction_56"
    t.integer  "replacement_57_colnum"
    t.integer  "replacement_manufacturer_57_colnum"
    t.string   "replacement_default_manufacturer_57",    :limit => 50
    t.integer  "replacement_direction_57"
    t.integer  "replacement_58_colnum"
    t.integer  "replacement_manufacturer_58_colnum"
    t.string   "replacement_default_manufacturer_58",    :limit => 50
    t.integer  "replacement_direction_58"
    t.integer  "replacement_59_colnum"
    t.integer  "replacement_manufacturer_59_colnum"
    t.string   "replacement_default_manufacturer_59",    :limit => 50
    t.integer  "replacement_direction_59"
    t.integer  "replacement_60_colnum"
    t.integer  "replacement_manufacturer_60_colnum"
    t.string   "replacement_default_manufacturer_60",    :limit => 50
    t.integer  "replacement_direction_60"
    t.integer  "replacement_61_colnum"
    t.integer  "replacement_manufacturer_61_colnum"
    t.string   "replacement_default_manufacturer_61",    :limit => 50
    t.integer  "replacement_direction_61"
    t.integer  "replacement_62_colnum"
    t.integer  "replacement_manufacturer_62_colnum"
    t.string   "replacement_default_manufacturer_62",    :limit => 50
    t.integer  "replacement_direction_62"
    t.integer  "replacement_63_colnum"
    t.integer  "replacement_manufacturer_63_colnum"
    t.string   "replacement_default_manufacturer_63",    :limit => 50
    t.integer  "replacement_direction_63"
    t.integer  "replacement_64_colnum"
    t.integer  "replacement_manufacturer_64_colnum"
    t.string   "replacement_default_manufacturer_64",    :limit => 50
    t.integer  "replacement_direction_64"
    t.integer  "replacement_65_colnum"
    t.integer  "replacement_manufacturer_65_colnum"
    t.string   "replacement_default_manufacturer_65",    :limit => 50
    t.integer  "replacement_direction_65"
    t.integer  "replacement_66_colnum"
    t.integer  "replacement_manufacturer_66_colnum"
    t.string   "replacement_default_manufacturer_66",    :limit => 50
    t.integer  "replacement_direction_66"
    t.integer  "replacement_67_colnum"
    t.integer  "replacement_manufacturer_67_colnum"
    t.string   "replacement_default_manufacturer_67",    :limit => 50
    t.integer  "replacement_direction_67"
    t.integer  "replacement_68_colnum"
    t.integer  "replacement_manufacturer_68_colnum"
    t.string   "replacement_default_manufacturer_68",    :limit => 50
    t.integer  "replacement_direction_68"
    t.integer  "replacement_69_colnum"
    t.integer  "replacement_manufacturer_69_colnum"
    t.string   "replacement_default_manufacturer_69",    :limit => 50
    t.integer  "replacement_direction_69"
    t.integer  "replacement_70_colnum"
    t.integer  "replacement_manufacturer_70_colnum"
    t.string   "replacement_default_manufacturer_70",    :limit => 50
    t.integer  "replacement_direction_70"
    t.integer  "replacement_71_colnum"
    t.integer  "replacement_manufacturer_71_colnum"
    t.string   "replacement_default_manufacturer_71",    :limit => 50
    t.integer  "replacement_direction_71"
    t.integer  "replacement_72_colnum"
    t.integer  "replacement_manufacturer_72_colnum"
    t.string   "replacement_default_manufacturer_72",    :limit => 50
    t.integer  "replacement_direction_72"
    t.integer  "replacement_73_colnum"
    t.integer  "replacement_manufacturer_73_colnum"
    t.string   "replacement_default_manufacturer_73",    :limit => 50
    t.integer  "replacement_direction_73"
    t.integer  "replacement_74_colnum"
    t.integer  "replacement_manufacturer_74_colnum"
    t.string   "replacement_default_manufacturer_74",    :limit => 50
    t.integer  "replacement_direction_74"
    t.integer  "replacement_75_colnum"
    t.integer  "replacement_manufacturer_75_colnum"
    t.string   "replacement_default_manufacturer_75",    :limit => 50
    t.integer  "replacement_direction_75"
    t.integer  "replacement_76_colnum"
    t.integer  "replacement_manufacturer_76_colnum"
    t.string   "replacement_default_manufacturer_76",    :limit => 50
    t.integer  "replacement_direction_76"
    t.integer  "replacement_77_colnum"
    t.integer  "replacement_manufacturer_77_colnum"
    t.string   "replacement_default_manufacturer_77",    :limit => 50
    t.integer  "replacement_direction_77"
    t.integer  "replacement_78_colnum"
    t.integer  "replacement_manufacturer_78_colnum"
    t.string   "replacement_default_manufacturer_78",    :limit => 50
    t.integer  "replacement_direction_78"
    t.integer  "replacement_79_colnum"
    t.integer  "replacement_manufacturer_79_colnum"
    t.string   "replacement_default_manufacturer_79",    :limit => 50
    t.integer  "replacement_direction_79"
    t.integer  "array_replacement_colnum"
    t.integer  "array_replacement_manufacturer_colnum"
    t.integer  "array_replacement_default_manufacturer"
    t.string   "array_replacement_delimiter",            :limit => 5
    t.integer  "array_replacement_direction"
  end

  create_table "jobs", :force => true do |t|
    t.datetime "next_start"
    t.datetime "last_start"
    t.datetime "last_finish"
    t.integer  "seconds_between_jobs"
    t.integer  "seconds_working"
    t.string   "title"
    t.integer  "job_id"
    t.integer  "jobable_id"
    t.string   "jobable_type"
    t.integer  "supplier_id"
    t.string   "file_mask"
    t.boolean  "locked",               :default => false
    t.boolean  "active",               :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.boolean  "started_once"
    t.text     "last_error"
  end

  create_table "jobs_repeats", :id => false, :force => true do |t|
    t.integer  "repeat_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturer_synonyms", :force => true do |t|
    t.integer  "manufacturer_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "manufacturer_synonyms", ["manufacturer_id"], :name => "index_manufacturer_synonyms_on_manufacturer_id"

  create_table "manufacturers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "manufacturers", ["title"], :name => "index_manufacturers_on_title"

  create_table "mies", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.integer  "thousand_kilometers"
    t.integer  "months"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_00", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_01", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_02", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_03", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_04", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_05", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_06", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_07", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_08", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_09", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_0a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_0b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_0c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_0d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_0e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_0f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_10", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_11", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_12", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_13", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_14", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_15", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_16", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_17", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_18", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_19", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_1a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_1b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_1c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_1d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_1e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_1f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_20", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_21", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_22", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_23", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_24", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_25", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_26", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_27", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_28", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_29", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_2a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_2b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_2c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_2d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_2e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_2f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_30", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_31", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_32", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_33", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_34", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_35", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_36", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_37", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_38", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_39", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_3a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_3b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_3c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_3d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_3e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_3f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_40", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_41", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_42", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_43", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_44", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_45", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_46", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_47", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_48", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_49", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_4a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_4b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_4c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_4d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_4e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_4f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_50", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_51", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_52", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_53", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_54", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_55", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_56", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_57", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_58", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_59", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_5a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_5b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_5c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_5d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_5e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_5f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_60", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_61", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_62", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_63", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_64", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_65", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_66", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_67", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_68", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_69", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_6a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_6b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_6c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_6d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_6e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_6f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_70", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_71", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_72", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_73", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_74", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_75", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_76", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_77", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_78", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_79", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_7a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_7b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_7c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_7d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_7e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_7f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_80", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_81", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_82", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_83", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_84", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_85", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_86", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_87", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_88", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_89", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_8a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_8b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_8c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_8d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_8e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_8f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_90", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_91", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_92", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_93", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_94", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_95", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_96", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_97", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_98", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_99", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_9a", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_9b", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_9c", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_9d", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_9e", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_9f", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a0", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a1", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a2", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a3", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a4", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a5", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a6", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a7", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a8", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_a9", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_aa", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ab", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ac", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ad", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ae", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_af", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b0", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b1", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b2", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b3", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b4", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b5", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b6", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b7", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b8", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_b9", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ba", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_bb", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_bc", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_bd", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_be", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_bf", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c0", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c1", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c2", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c3", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c4", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c5", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c6", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c7", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c8", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_c9", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ca", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_cb", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_cc", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_cd", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ce", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_cf", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d0", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d1", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d2", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d3", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d4", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d5", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d6", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d7", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d8", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_d9", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_da", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_db", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_dc", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_dd", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_de", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_df", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e0", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e1", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e2", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e3", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e4", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e5", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e6", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e7", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e8", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_e9", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ea", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_eb", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ec", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ed", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ee", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ef", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f0", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f1", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f2", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f3", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f4", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f5", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f6", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f7", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f8", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_f9", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_fa", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_fb", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_fc", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_fd", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_fe", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_ff", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                          :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_catalog_templates", :force => true do |t|
    t.integer  "job_id"
    t.string   "manufacturer"
    t.string   "catalog_number"
    t.decimal  "weight_grams",                                :precision => 10, :scale => 0
    t.string   "replacement_catalog_number_0",  :limit => 50
    t.string   "replacement_manufacturer_0",    :limit => 50
    t.string   "replacement_catalog_number_1",  :limit => 50
    t.string   "replacement_manufacturer_1",    :limit => 50
    t.string   "replacement_catalog_number_2",  :limit => 50
    t.string   "replacement_manufacturer_2",    :limit => 50
    t.string   "replacement_catalog_number_3",  :limit => 50
    t.string   "replacement_manufacturer_3",    :limit => 50
    t.string   "replacement_catalog_number_4",  :limit => 50
    t.string   "replacement_manufacturer_4",    :limit => 50
    t.string   "replacement_catalog_number_5",  :limit => 50
    t.string   "replacement_manufacturer_5",    :limit => 50
    t.string   "replacement_catalog_number_6",  :limit => 50
    t.string   "replacement_manufacturer_6",    :limit => 50
    t.string   "replacement_catalog_number_7",  :limit => 50
    t.string   "replacement_manufacturer_7",    :limit => 50
    t.string   "replacement_catalog_number_8",  :limit => 50
    t.string   "replacement_manufacturer_8",    :limit => 50
    t.string   "replacement_catalog_number_9",  :limit => 50
    t.string   "replacement_manufacturer_9",    :limit => 50
    t.string   "replacement_catalog_number_10", :limit => 50
    t.string   "replacement_manufacturer_10",   :limit => 50
    t.string   "replacement_catalog_number_11", :limit => 50
    t.string   "replacement_manufacturer_11",   :limit => 50
    t.string   "replacement_catalog_number_12", :limit => 50
    t.string   "replacement_manufacturer_12",   :limit => 50
    t.string   "replacement_catalog_number_13", :limit => 50
    t.string   "replacement_manufacturer_13",   :limit => 50
    t.string   "replacement_catalog_number_14", :limit => 50
    t.string   "replacement_manufacturer_14",   :limit => 50
    t.string   "replacement_catalog_number_15", :limit => 50
    t.string   "replacement_manufacturer_15",   :limit => 50
    t.string   "replacement_catalog_number_16", :limit => 50
    t.string   "replacement_manufacturer_16",   :limit => 50
    t.string   "replacement_catalog_number_17", :limit => 50
    t.string   "replacement_manufacturer_17",   :limit => 50
    t.string   "replacement_catalog_number_18", :limit => 50
    t.string   "replacement_manufacturer_18",   :limit => 50
    t.string   "replacement_catalog_number_19", :limit => 50
    t.string   "replacement_manufacturer_19",   :limit => 50
    t.string   "replacement_catalog_number_20", :limit => 50
    t.string   "replacement_manufacturer_20",   :limit => 50
    t.string   "replacement_catalog_number_21", :limit => 50
    t.string   "replacement_manufacturer_21",   :limit => 50
    t.string   "replacement_catalog_number_22", :limit => 50
    t.string   "replacement_manufacturer_22",   :limit => 50
    t.string   "replacement_catalog_number_23", :limit => 50
    t.string   "replacement_manufacturer_23",   :limit => 50
    t.string   "replacement_catalog_number_24", :limit => 50
    t.string   "replacement_manufacturer_24",   :limit => 50
    t.string   "replacement_catalog_number_25", :limit => 50
    t.string   "replacement_manufacturer_25",   :limit => 50
    t.string   "replacement_catalog_number_26", :limit => 50
    t.string   "replacement_manufacturer_26",   :limit => 50
    t.string   "replacement_catalog_number_27", :limit => 50
    t.string   "replacement_manufacturer_27",   :limit => 50
    t.string   "replacement_catalog_number_28", :limit => 50
    t.string   "replacement_manufacturer_28",   :limit => 50
    t.string   "replacement_catalog_number_29", :limit => 50
    t.string   "replacement_manufacturer_29",   :limit => 50
    t.string   "replacement_catalog_number_30", :limit => 50
    t.string   "replacement_manufacturer_30",   :limit => 50
    t.string   "replacement_catalog_number_31", :limit => 50
    t.string   "replacement_manufacturer_31",   :limit => 50
    t.string   "replacement_catalog_number_32", :limit => 50
    t.string   "replacement_manufacturer_32",   :limit => 50
    t.string   "replacement_catalog_number_33", :limit => 50
    t.string   "replacement_manufacturer_33",   :limit => 50
    t.string   "replacement_catalog_number_34", :limit => 50
    t.string   "replacement_manufacturer_34",   :limit => 50
    t.string   "replacement_catalog_number_35", :limit => 50
    t.string   "replacement_manufacturer_35",   :limit => 50
    t.string   "replacement_catalog_number_36", :limit => 50
    t.string   "replacement_manufacturer_36",   :limit => 50
    t.string   "replacement_catalog_number_37", :limit => 50
    t.string   "replacement_manufacturer_37",   :limit => 50
    t.string   "replacement_catalog_number_38", :limit => 50
    t.string   "replacement_manufacturer_38",   :limit => 50
    t.string   "replacement_catalog_number_39", :limit => 50
    t.string   "replacement_manufacturer_39",   :limit => 50
    t.string   "replacement_catalog_number_40", :limit => 50
    t.string   "replacement_manufacturer_40",   :limit => 50
    t.string   "replacement_catalog_number_41", :limit => 50
    t.string   "replacement_manufacturer_41",   :limit => 50
    t.string   "replacement_catalog_number_42", :limit => 50
    t.string   "replacement_manufacturer_42",   :limit => 50
    t.string   "replacement_catalog_number_43", :limit => 50
    t.string   "replacement_manufacturer_43",   :limit => 50
    t.string   "replacement_catalog_number_44", :limit => 50
    t.string   "replacement_manufacturer_44",   :limit => 50
    t.string   "replacement_catalog_number_45", :limit => 50
    t.string   "replacement_manufacturer_45",   :limit => 50
    t.string   "replacement_catalog_number_46", :limit => 50
    t.string   "replacement_manufacturer_46",   :limit => 50
    t.string   "replacement_catalog_number_47", :limit => 50
    t.string   "replacement_manufacturer_47",   :limit => 50
    t.string   "replacement_catalog_number_48", :limit => 50
    t.string   "replacement_manufacturer_48",   :limit => 50
    t.string   "replacement_catalog_number_49", :limit => 50
    t.string   "replacement_manufacturer_49",   :limit => 50
    t.string   "replacement_catalog_number_50", :limit => 50
    t.string   "replacement_manufacturer_50",   :limit => 50
    t.string   "replacement_catalog_number_51", :limit => 50
    t.string   "replacement_manufacturer_51",   :limit => 50
    t.string   "replacement_catalog_number_52", :limit => 50
    t.string   "replacement_manufacturer_52",   :limit => 50
    t.string   "replacement_catalog_number_53", :limit => 50
    t.string   "replacement_manufacturer_53",   :limit => 50
    t.string   "replacement_catalog_number_54", :limit => 50
    t.string   "replacement_manufacturer_54",   :limit => 50
    t.string   "replacement_catalog_number_55", :limit => 50
    t.string   "replacement_manufacturer_55",   :limit => 50
    t.string   "replacement_catalog_number_56", :limit => 50
    t.string   "replacement_manufacturer_56",   :limit => 50
    t.string   "replacement_catalog_number_57", :limit => 50
    t.string   "replacement_manufacturer_57",   :limit => 50
    t.string   "replacement_catalog_number_58", :limit => 50
    t.string   "replacement_manufacturer_58",   :limit => 50
    t.string   "replacement_catalog_number_59", :limit => 50
    t.string   "replacement_manufacturer_59",   :limit => 50
    t.string   "replacement_catalog_number_60", :limit => 50
    t.string   "replacement_manufacturer_60",   :limit => 50
    t.string   "replacement_catalog_number_61", :limit => 50
    t.string   "replacement_manufacturer_61",   :limit => 50
    t.string   "replacement_catalog_number_62", :limit => 50
    t.string   "replacement_manufacturer_62",   :limit => 50
    t.string   "replacement_catalog_number_63", :limit => 50
    t.string   "replacement_manufacturer_63",   :limit => 50
    t.string   "replacement_catalog_number_64", :limit => 50
    t.string   "replacement_manufacturer_64",   :limit => 50
    t.string   "replacement_catalog_number_65", :limit => 50
    t.string   "replacement_manufacturer_65",   :limit => 50
    t.string   "replacement_catalog_number_66", :limit => 50
    t.string   "replacement_manufacturer_66",   :limit => 50
    t.string   "replacement_catalog_number_67", :limit => 50
    t.string   "replacement_manufacturer_67",   :limit => 50
    t.string   "replacement_catalog_number_68", :limit => 50
    t.string   "replacement_manufacturer_68",   :limit => 50
    t.string   "replacement_catalog_number_69", :limit => 50
    t.string   "replacement_manufacturer_69",   :limit => 50
    t.string   "replacement_catalog_number_70", :limit => 50
    t.string   "replacement_manufacturer_70",   :limit => 50
    t.string   "replacement_catalog_number_71", :limit => 50
    t.string   "replacement_manufacturer_71",   :limit => 50
    t.string   "replacement_catalog_number_72", :limit => 50
    t.string   "replacement_manufacturer_72",   :limit => 50
    t.string   "replacement_catalog_number_73", :limit => 50
    t.string   "replacement_manufacturer_73",   :limit => 50
    t.string   "replacement_catalog_number_74", :limit => 50
    t.string   "replacement_manufacturer_74",   :limit => 50
    t.string   "replacement_catalog_number_75", :limit => 50
    t.string   "replacement_manufacturer_75",   :limit => 50
    t.string   "replacement_catalog_number_76", :limit => 50
    t.string   "replacement_manufacturer_76",   :limit => 50
    t.string   "replacement_catalog_number_77", :limit => 50
    t.string   "replacement_manufacturer_77",   :limit => 50
    t.string   "replacement_catalog_number_78", :limit => 50
    t.string   "replacement_manufacturer_78",   :limit => 50
    t.string   "replacement_catalog_number_79", :limit => 50
    t.string   "replacement_manufacturer_79",   :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_cost_00", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_00", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_00", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_00", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_01", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_01", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_01", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_01", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_02", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_02", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_02", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_02", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_03", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_03", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_03", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_03", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_04", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_04", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_04", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_04", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_05", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_05", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_05", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_05", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_06", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_06", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_06", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_06", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_07", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_07", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_07", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_07", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_08", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_08", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_08", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_08", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_09", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_09", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_09", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_09", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_0a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_0a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_0a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_0a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_0b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_0b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_0b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_0b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_0c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_0c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_0c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_0c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_0d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_0d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_0d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_0d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_0e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_0e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_0e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_0e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_0f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_0f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_0f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_0f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_10", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_10", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_10", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_10", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_11", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_11", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_11", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_11", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_12", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_12", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_12", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_12", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_13", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_13", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_13", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_13", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_14", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_14", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_14", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_14", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_15", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_15", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_15", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_15", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_16", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_16", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_16", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_16", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_17", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_17", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_17", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_17", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_18", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_18", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_18", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_18", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_19", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_19", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_19", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_19", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_1a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_1a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_1a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_1a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_1b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_1b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_1b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_1b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_1c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_1c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_1c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_1c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_1d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_1d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_1d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_1d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_1e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_1e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_1e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_1e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_1f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_1f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_1f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_1f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_20", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_20", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_20", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_20", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_21", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_21", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_21", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_21", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_22", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_22", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_22", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_22", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_23", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_23", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_23", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_23", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_24", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_24", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_24", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_24", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_25", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_25", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_25", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_25", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_26", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_26", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_26", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_26", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_27", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_27", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_27", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_27", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_28", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_28", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_28", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_28", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_29", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_29", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_29", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_29", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_2a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_2a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_2a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_2a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_2b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_2b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_2b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_2b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_2c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_2c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_2c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_2c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_2d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_2d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_2d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_2d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_2e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_2e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_2e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_2e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_2f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_2f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_2f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_2f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_30", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_30", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_30", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_30", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_31", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_31", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_31", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_31", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_32", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_32", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_32", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_32", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_33", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_33", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_33", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_33", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_34", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_34", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_34", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_34", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_35", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_35", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_35", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_35", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_36", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_36", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_36", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_36", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_37", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_37", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_37", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_37", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_38", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_38", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_38", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_38", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_39", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_39", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_39", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_39", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_3a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_3a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_3a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_3a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_3b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_3b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_3b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_3b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_3c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_3c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_3c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_3c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_3d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_3d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_3d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_3d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_3e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_3e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_3e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_3e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_3f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_3f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_3f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_3f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_40", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_40", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_40", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_40", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_41", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_41", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_41", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_41", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_42", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_42", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_42", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_42", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_43", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_43", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_43", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_43", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_44", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_44", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_44", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_44", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_45", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_45", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_45", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_45", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_46", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_46", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_46", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_46", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_47", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_47", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_47", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_47", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_48", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_48", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_48", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_48", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_49", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_49", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_49", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_49", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_4a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_4a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_4a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_4a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_4b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_4b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_4b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_4b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_4c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_4c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_4c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_4c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_4d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_4d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_4d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_4d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_4e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_4e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_4e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_4e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_4f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_4f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_4f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_4f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_50", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_50", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_50", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_50", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_51", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_51", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_51", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_51", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_52", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_52", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_52", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_52", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_53", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_53", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_53", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_53", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_54", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_54", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_54", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_54", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_55", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_55", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_55", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_55", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_56", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_56", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_56", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_56", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_57", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_57", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_57", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_57", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_58", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_58", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_58", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_58", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_59", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_59", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_59", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_59", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_5a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_5a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_5a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_5a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_5b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_5b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_5b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_5b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_5c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_5c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_5c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_5c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_5d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_5d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_5d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_5d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_5e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_5e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_5e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_5e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_5f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_5f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_5f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_5f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_60", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_60", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_60", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_60", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_61", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_61", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_61", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_61", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_62", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_62", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_62", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_62", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_63", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_63", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_63", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_63", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_64", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_64", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_64", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_64", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_65", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_65", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_65", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_65", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_66", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_66", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_66", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_66", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_67", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_67", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_67", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_67", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_68", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_68", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_68", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_68", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_69", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_69", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_69", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_69", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_6a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_6a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_6a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_6a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_6b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_6b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_6b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_6b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_6c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_6c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_6c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_6c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_6d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_6d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_6d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_6d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_6e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_6e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_6e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_6e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_6f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_6f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_6f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_6f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_70", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_70", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_70", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_70", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_71", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_71", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_71", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_71", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_72", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_72", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_72", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_72", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_73", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_73", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_73", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_73", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_74", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_74", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_74", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_74", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_75", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_75", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_75", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_75", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_76", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_76", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_76", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_76", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_77", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_77", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_77", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_77", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_78", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_78", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_78", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_78", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_79", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_79", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_79", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_79", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_7a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_7a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_7a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_7a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_7b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_7b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_7b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_7b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_7c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_7c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_7c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_7c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_7d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_7d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_7d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_7d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_7e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_7e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_7e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_7e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_7f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_7f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_7f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_7f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_80", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_80", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_80", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_80", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_81", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_81", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_81", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_81", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_82", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_82", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_82", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_82", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_83", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_83", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_83", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_83", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_84", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_84", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_84", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_84", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_85", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_85", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_85", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_85", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_86", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_86", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_86", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_86", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_87", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_87", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_87", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_87", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_88", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_88", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_88", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_88", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_89", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_89", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_89", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_89", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_8a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_8a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_8a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_8a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_8b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_8b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_8b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_8b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_8c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_8c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_8c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_8c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_8d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_8d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_8d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_8d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_8e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_8e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_8e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_8e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_8f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_8f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_8f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_8f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_90", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_90", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_90", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_90", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_91", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_91", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_91", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_91", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_92", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_92", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_92", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_92", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_93", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_93", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_93", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_93", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_94", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_94", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_94", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_94", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_95", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_95", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_95", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_95", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_96", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_96", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_96", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_96", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_97", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_97", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_97", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_97", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_98", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_98", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_98", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_98", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_99", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_99", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_99", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_99", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_9a", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_9a", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_9a", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_9a", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_9b", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_9b", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_9b", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_9b", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_9c", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_9c", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_9c", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_9c", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_9d", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_9d", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_9d", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_9d", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_9e", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_9e", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_9e", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_9e", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_9f", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_9f", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_9f", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_9f", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a0", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a0", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a0", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a0", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a1", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a1", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a1", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a1", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a2", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a2", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a2", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a2", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a3", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a3", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a3", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a3", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a4", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a4", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a4", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a4", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a5", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a5", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a5", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a5", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a6", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a6", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a6", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a6", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a7", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a7", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a7", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a7", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a8", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a8", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a8", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a8", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_a9", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_a9", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_a9", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_a9", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_aa", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_aa", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_aa", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_aa", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ab", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ab", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ab", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ab", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ac", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ac", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ac", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ac", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ad", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ad", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ad", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ad", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ae", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ae", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ae", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ae", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_af", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_af", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_af", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_af", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b0", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b0", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b0", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b0", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b1", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b1", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b1", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b1", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b2", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b2", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b2", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b2", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b3", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b3", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b3", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b3", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b4", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b4", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b4", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b4", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b5", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b5", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b5", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b5", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b6", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b6", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b6", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b6", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b7", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b7", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b7", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b7", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b8", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b8", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b8", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b8", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_b9", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_b9", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_b9", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_b9", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ba", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ba", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ba", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ba", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_bb", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_bb", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_bb", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_bb", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_bc", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_bc", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_bc", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_bc", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_bd", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_bd", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_bd", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_bd", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_be", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_be", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_be", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_be", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_bf", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_bf", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_bf", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_bf", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c0", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c0", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c0", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c0", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c1", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c1", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c1", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c1", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c2", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c2", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c2", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c2", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c3", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c3", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c3", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c3", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c4", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c4", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c4", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c4", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c5", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c5", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c5", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c5", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c6", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c6", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c6", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c6", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c7", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c7", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c7", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c7", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c8", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c8", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c8", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c8", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_c9", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_c9", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_c9", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_c9", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ca", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ca", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ca", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ca", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_cb", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_cb", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_cb", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_cb", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_cc", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_cc", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_cc", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_cc", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_cd", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_cd", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_cd", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_cd", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ce", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ce", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ce", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ce", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_cf", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_cf", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_cf", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_cf", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d0", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d0", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d0", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d0", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d1", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d1", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d1", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d1", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d2", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d2", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d2", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d2", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d3", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d3", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d3", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d3", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d4", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d4", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d4", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d4", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d5", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d5", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d5", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d5", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d6", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d6", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d6", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d6", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d7", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d7", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d7", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d7", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d8", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d8", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d8", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d8", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_d9", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_d9", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_d9", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_d9", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_da", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_da", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_da", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_da", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_db", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_db", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_db", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_db", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_dc", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_dc", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_dc", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_dc", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_dd", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_dd", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_dd", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_dd", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_de", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_de", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_de", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_de", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_df", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_df", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_df", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_df", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e0", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e0", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e0", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e0", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e1", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e1", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e1", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e1", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e2", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e2", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e2", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e2", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e3", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e3", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e3", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e3", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e4", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e4", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e4", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e4", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e5", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e5", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e5", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e5", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e6", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e6", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e6", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e6", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e7", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e7", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e7", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e7", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e8", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e8", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e8", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e8", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_e9", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_e9", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_e9", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_e9", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ea", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ea", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ea", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ea", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_eb", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_eb", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_eb", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_eb", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ec", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ec", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ec", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ec", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ed", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ed", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ed", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ed", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ee", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ee", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ee", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ee", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ef", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ef", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ef", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ef", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f0", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f0", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f0", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f0", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f1", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f1", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f1", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f1", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f2", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f2", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f2", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f2", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f3", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f3", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f3", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f3", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f4", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f4", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f4", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f4", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f5", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f5", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f5", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f5", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f6", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f6", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f6", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f6", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f7", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f7", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f7", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f7", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f8", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f8", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f8", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f8", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_f9", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_f9", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_f9", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_f9", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_fa", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_fa", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_fa", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_fa", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_fb", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_fb", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_fb", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_fb", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_fc", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_fc", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_fc", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_fc", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_fd", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_fd", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_fd", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_fd", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_fe", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_fe", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_fe", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_fe", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_ff", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "price_cost_ff", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "price_cost_ff", ["job_code"], :name => "index_prices_on_job_code"
  add_index "price_cost_ff", ["job_id"], :name => "index_prices_on_job_id"

  create_table "price_cost_templates", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.integer  "processed"
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "success_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_import_1066346353", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346353", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346355", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",          :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.integer  "processed"
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",        :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r0"
    t.string   "rm0"
    t.string   "r1"
    t.string   "rm1"
    t.string   "r2"
    t.string   "rm2"
    t.string   "r3"
    t.string   "rm3"
    t.string   "r4"
    t.string   "rm4"
    t.string   "r5"
    t.string   "rm5"
    t.string   "r6"
    t.string   "rm6"
    t.string   "r7"
    t.string   "rm7"
    t.string   "r8"
    t.string   "rm8"
    t.string   "r9"
    t.string   "rm9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346355", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346396", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346396", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346421", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346421", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346422", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346422", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346423", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346423", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346424", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346424", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346425", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346425", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346426", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346426", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346507", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346507", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346512", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346512", ["doublet"], :name => "doublet_idx"

  create_table "price_import_1066346519", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_import_1066346519", ["doublet"], :name => "doublet_idx"

  create_table "price_import_templates", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 0
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number"
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.string   "job_code"
    t.boolean  "processed",                                                        :default => false
    t.string   "delivery_days_price"
    t.decimal  "weight_grams",                      :precision => 10, :scale => 0
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "r1",                  :limit => 20
    t.string   "rm1",                 :limit => 20
    t.string   "r2",                  :limit => 20
    t.string   "rm2",                 :limit => 20
    t.string   "r3",                  :limit => 20
    t.string   "rm3",                 :limit => 20
    t.string   "r4",                  :limit => 20
    t.string   "rm4",                 :limit => 20
    t.string   "r5",                  :limit => 20
    t.string   "rm5",                 :limit => 20
    t.string   "r6",                  :limit => 20
    t.string   "rm6",                 :limit => 20
    t.string   "r7",                  :limit => 20
    t.string   "rm7",                 :limit => 20
    t.string   "r8",                  :limit => 20
    t.string   "rm8",                 :limit => 20
    t.string   "r9",                  :limit => 20
    t.string   "rm9",                 :limit => 20
    t.string   "r10",                 :limit => 20
    t.string   "rm10",                :limit => 20
    t.string   "r11",                 :limit => 20
    t.string   "rm11",                :limit => 20
    t.string   "r12",                 :limit => 20
    t.string   "rm12",                :limit => 20
    t.string   "r13",                 :limit => 20
    t.string   "rm13",                :limit => 20
    t.string   "r14",                 :limit => 20
    t.string   "rm14",                :limit => 20
    t.string   "r15",                 :limit => 20
    t.string   "rm15",                :limit => 20
    t.string   "r16",                 :limit => 20
    t.string   "rm16",                :limit => 20
    t.string   "r17",                 :limit => 20
    t.string   "rm17",                :limit => 20
    t.string   "r18",                 :limit => 20
    t.string   "rm18",                :limit => 20
    t.string   "r19",                 :limit => 20
    t.string   "rm19",                :limit => 20
    t.string   "r20",                 :limit => 20
    t.string   "rm20",                :limit => 20
    t.string   "r21",                 :limit => 20
    t.string   "rm21",                :limit => 20
    t.string   "r22",                 :limit => 20
    t.string   "rm22",                :limit => 20
    t.string   "r23",                 :limit => 20
    t.string   "rm23",                :limit => 20
    t.string   "r24",                 :limit => 20
    t.string   "rm24",                :limit => 20
    t.string   "r25",                 :limit => 20
    t.string   "rm25",                :limit => 20
    t.string   "r26",                 :limit => 20
    t.string   "rm26",                :limit => 20
    t.string   "r27",                 :limit => 20
    t.string   "rm27",                :limit => 20
    t.string   "r28",                 :limit => 20
    t.string   "rm28",                :limit => 20
    t.string   "r29",                 :limit => 20
    t.string   "rm29",                :limit => 20
    t.string   "r30",                 :limit => 20
    t.string   "rm30",                :limit => 20
    t.string   "r31",                 :limit => 20
    t.string   "rm31",                :limit => 20
    t.string   "r32",                 :limit => 20
    t.string   "rm32",                :limit => 20
    t.string   "r33",                 :limit => 20
    t.string   "rm33",                :limit => 20
    t.string   "r34",                 :limit => 20
    t.string   "rm34",                :limit => 20
    t.string   "r35",                 :limit => 20
    t.string   "rm35",                :limit => 20
    t.string   "r36",                 :limit => 20
    t.string   "rm36",                :limit => 20
    t.string   "r37",                 :limit => 20
    t.string   "rm37",                :limit => 20
    t.string   "r38",                 :limit => 20
    t.string   "rm38",                :limit => 20
    t.string   "r39",                 :limit => 20
    t.string   "rm39",                :limit => 20
    t.string   "r40",                 :limit => 20
    t.string   "rm40",                :limit => 20
    t.string   "r41",                 :limit => 20
    t.string   "rm41",                :limit => 20
    t.string   "r42",                 :limit => 20
    t.string   "rm42",                :limit => 20
    t.string   "r43",                 :limit => 20
    t.string   "rm43",                :limit => 20
    t.string   "r44",                 :limit => 20
    t.string   "rm44",                :limit => 20
    t.string   "r45",                 :limit => 20
    t.string   "rm45",                :limit => 20
    t.string   "r46",                 :limit => 20
    t.string   "rm46",                :limit => 20
    t.string   "r47",                 :limit => 20
    t.string   "rm47",                :limit => 20
    t.string   "r48",                 :limit => 20
    t.string   "rm48",                :limit => 20
    t.string   "r49",                 :limit => 20
    t.string   "rm49",                :limit => 20
    t.string   "r50",                 :limit => 20
    t.string   "rm50",                :limit => 20
    t.string   "r51",                 :limit => 20
    t.string   "rm51",                :limit => 20
    t.string   "r52",                 :limit => 20
    t.string   "rm52",                :limit => 20
    t.string   "r53",                 :limit => 20
    t.string   "rm53",                :limit => 20
    t.string   "r54",                 :limit => 20
    t.string   "rm54",                :limit => 20
    t.string   "r55",                 :limit => 20
    t.string   "rm55",                :limit => 20
    t.string   "r56",                 :limit => 20
    t.string   "rm56",                :limit => 20
    t.string   "r57",                 :limit => 20
    t.string   "rm57",                :limit => 20
    t.string   "r58",                 :limit => 20
    t.string   "rm58",                :limit => 20
    t.string   "r59",                 :limit => 20
    t.string   "rm59",                :limit => 20
    t.string   "r60",                 :limit => 20
    t.string   "rm60",                :limit => 20
    t.string   "r61",                 :limit => 20
    t.string   "rm61",                :limit => 20
    t.string   "r62",                 :limit => 20
    t.string   "rm62",                :limit => 20
    t.string   "r63",                 :limit => 20
    t.string   "rm63",                :limit => 20
    t.string   "r64",                 :limit => 20
    t.string   "rm64",                :limit => 20
    t.string   "r65",                 :limit => 20
    t.string   "rm65",                :limit => 20
    t.string   "r66",                 :limit => 20
    t.string   "rm66",                :limit => 20
    t.string   "r67",                 :limit => 20
    t.string   "rm67",                :limit => 20
    t.string   "r68",                 :limit => 20
    t.string   "rm68",                :limit => 20
    t.string   "r69",                 :limit => 20
    t.string   "rm69",                :limit => 20
    t.string   "r70",                 :limit => 20
    t.string   "rm70",                :limit => 20
    t.string   "r71",                 :limit => 20
    t.string   "rm71",                :limit => 20
    t.string   "r72",                 :limit => 20
    t.string   "rm72",                :limit => 20
    t.string   "r73",                 :limit => 20
    t.string   "rm73",                :limit => 20
    t.string   "r74",                 :limit => 20
    t.string   "rm74",                :limit => 20
    t.string   "r75",                 :limit => 20
    t.string   "rm75",                :limit => 20
    t.string   "r76",                 :limit => 20
    t.string   "rm76",                :limit => 20
    t.string   "r77",                 :limit => 20
    t.string   "rm77",                :limit => 20
    t.string   "r78",                 :limit => 20
    t.string   "rm78",                :limit => 20
    t.string   "r79",                 :limit => 20
    t.string   "rm79",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                         :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 100
    t.string   "catalog_number",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.integer  "supplier_id"
    t.string   "job_code",            :limit => 20
    t.string   "doublet"
    t.boolean  "processed",                                                         :default => false
    t.integer  "delivery_days_price"
  end

  add_index "prices", ["catalog_number", "manufacturer"], :name => "index_prices_on_catalog_number_and_manufacturer"
  add_index "prices", ["job_code"], :name => "index_prices_on_job_code"
  add_index "prices", ["job_id"], :name => "index_prices_on_job_id"

  create_table "receive_jobs", :force => true do |t|
    t.integer  "receiveable_id"
    t.string   "receiveable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repeats", :force => true do |t|
    t.string   "cron_string"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "smb_receives", :force => true do |t|
    t.string   "server",     :default => "rif2010"
    t.string   "share"
    t.integer  "port",       :default => 445
    t.string   "path",       :default => "/"
    t.string   "login",      :default => "office"
    t.string   "password",   :default => "2"
    t.string   "workgroup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplier_prices", :force => true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.string   "attachment_file_size",    :limit => 20
    t.datetime "attachment_updated_at"
    t.string   "md5",                     :limit => 50
    t.integer  "supplier_id"
    t.string   "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_code"
    t.integer  "job_id"
    t.string   "wc_stat"
    t.string   "group_code"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "title"
    t.string   "inn",                    :limit => 12
    t.string   "kpp",                    :limit => 9
    t.string   "login"
    t.string   "password"
    t.string   "contact_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title_short"
    t.string   "title_en"
    t.string   "title_full"
    t.string   "okpo"
    t.string   "okato"
    t.string   "ogrn"
    t.string   "legal_address"
    t.string   "actual_address"
    t.string   "bik_bank"
    t.string   "bank_title"
    t.string   "current_account"
    t.string   "correspondent_account"
    t.string   "buyer"
    t.string   "seller"
    t.string   "contract"
    t.string   "fio_head"
    t.string   "position_head"
    t.string   "fio_buh"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "emaildocs"
    t.integer  "discount_group_id"
    t.integer  "delivery_days_declared"
    t.integer  "delivery_days_average"
  end

  create_table "transmissions", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unpack_jobs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "archive_type"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
