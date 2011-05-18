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

ActiveRecord::Schema.define(:version => 20110325103643) do

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
    t.string   "server",     :default => "mail.avtorif.ru"
    t.string   "port",       :default => "110"
    t.boolean  "ssl"
    t.string   "login"
    t.string   "password"
    t.string   "protocol",   :default => "pop3"
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
    t.integer  "delivery_type_id"
    t.integer  "estimate_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manufacturer_colnum"
    t.integer  "catalog_number_colnum"
    t.integer  "title_colnum"
    t.integer  "count_colnum"
    t.integer  "multiplicity_colnum"
    t.integer  "income_price_colnum"
    t.integer  "external_id_colnum"
    t.integer  "weight_grams_colnum"
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
    t.float    "weight_coefficient"
    t.integer  "new_catalog_number_colnum"
    t.float    "absolute_buy_currency"
    t.float    "relative_buy_currency"
    t.float    "absolute_weight_currency"
    t.float    "relative_weight_currency"
    t.integer  "parts_group_colnum"
    t.string   "delivery_days_declared_colnum"
    t.integer  "price_setting_id"
    t.float    "income_rate"
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
    t.boolean  "original",   :default => false
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

  create_table "price_catalog_templates", :force => true do |t|
    t.integer  "job_id"
    t.string   "manufacturer",       :limit => 20
    t.string   "catalog_number",     :limit => 20
    t.string   "title"
    t.string   "title_en"
    t.integer  "weight_grams"
    t.string   "r0",                 :limit => 20
    t.string   "rm0",                :limit => 20
    t.string   "r1",                 :limit => 20
    t.string   "rm1",                :limit => 20
    t.string   "r2",                 :limit => 20
    t.string   "rm2",                :limit => 20
    t.string   "r3",                 :limit => 20
    t.string   "rm3",                :limit => 20
    t.string   "r4",                 :limit => 20
    t.string   "rm4",                :limit => 20
    t.string   "r5",                 :limit => 20
    t.string   "rm5",                :limit => 20
    t.string   "r6",                 :limit => 20
    t.string   "rm6",                :limit => 20
    t.string   "r7",                 :limit => 20
    t.string   "rm7",                :limit => 20
    t.string   "r8",                 :limit => 20
    t.string   "rm8",                :limit => 20
    t.string   "r9",                 :limit => 20
    t.string   "rm9",                :limit => 20
    t.string   "r10",                :limit => 20
    t.string   "rm10",               :limit => 20
    t.string   "r11",                :limit => 20
    t.string   "rm11",               :limit => 20
    t.string   "r12",                :limit => 20
    t.string   "rm12",               :limit => 20
    t.string   "r13",                :limit => 20
    t.string   "rm13",               :limit => 20
    t.string   "r14",                :limit => 20
    t.string   "rm14",               :limit => 20
    t.string   "r15",                :limit => 20
    t.string   "rm15",               :limit => 20
    t.string   "r16",                :limit => 20
    t.string   "rm16",               :limit => 20
    t.string   "r17",                :limit => 20
    t.string   "rm17",               :limit => 20
    t.string   "r18",                :limit => 20
    t.string   "rm18",               :limit => 20
    t.string   "r19",                :limit => 20
    t.string   "rm19",               :limit => 20
    t.string   "r20",                :limit => 20
    t.string   "rm20",               :limit => 20
    t.string   "r21",                :limit => 20
    t.string   "rm21",               :limit => 20
    t.string   "r22",                :limit => 20
    t.string   "rm22",               :limit => 20
    t.string   "r23",                :limit => 20
    t.string   "rm23",               :limit => 20
    t.string   "r24",                :limit => 20
    t.string   "rm24",               :limit => 20
    t.string   "r25",                :limit => 20
    t.string   "rm25",               :limit => 20
    t.string   "r26",                :limit => 20
    t.string   "rm26",               :limit => 20
    t.string   "r27",                :limit => 20
    t.string   "rm27",               :limit => 20
    t.string   "r28",                :limit => 20
    t.string   "rm28",               :limit => 20
    t.string   "r29",                :limit => 20
    t.string   "rm29",               :limit => 20
    t.string   "r30",                :limit => 20
    t.string   "rm30",               :limit => 20
    t.string   "r31",                :limit => 20
    t.string   "rm31",               :limit => 20
    t.string   "r32",                :limit => 20
    t.string   "rm32",               :limit => 20
    t.string   "r33",                :limit => 20
    t.string   "rm33",               :limit => 20
    t.string   "r34",                :limit => 20
    t.string   "rm34",               :limit => 20
    t.string   "r35",                :limit => 20
    t.string   "rm35",               :limit => 20
    t.string   "r36",                :limit => 20
    t.string   "rm36",               :limit => 20
    t.string   "r37",                :limit => 20
    t.string   "rm37",               :limit => 20
    t.string   "r38",                :limit => 20
    t.string   "rm38",               :limit => 20
    t.string   "r39",                :limit => 20
    t.string   "rm39",               :limit => 20
    t.string   "r40",                :limit => 20
    t.string   "rm40",               :limit => 20
    t.string   "r41",                :limit => 20
    t.string   "rm41",               :limit => 20
    t.string   "r42",                :limit => 20
    t.string   "rm42",               :limit => 20
    t.string   "r43",                :limit => 20
    t.string   "rm43",               :limit => 20
    t.string   "r44",                :limit => 20
    t.string   "rm44",               :limit => 20
    t.string   "r45",                :limit => 20
    t.string   "rm45",               :limit => 20
    t.string   "r46",                :limit => 20
    t.string   "rm46",               :limit => 20
    t.string   "r47",                :limit => 20
    t.string   "rm47",               :limit => 20
    t.string   "r48",                :limit => 20
    t.string   "rm48",               :limit => 20
    t.string   "r49",                :limit => 20
    t.string   "rm49",               :limit => 20
    t.string   "r50",                :limit => 20
    t.string   "rm50",               :limit => 20
    t.string   "r51",                :limit => 20
    t.string   "rm51",               :limit => 20
    t.string   "r52",                :limit => 20
    t.string   "rm52",               :limit => 20
    t.string   "r53",                :limit => 20
    t.string   "rm53",               :limit => 20
    t.string   "r54",                :limit => 20
    t.string   "rm54",               :limit => 20
    t.string   "r55",                :limit => 20
    t.string   "rm55",               :limit => 20
    t.string   "r56",                :limit => 20
    t.string   "rm56",               :limit => 20
    t.string   "r57",                :limit => 20
    t.string   "rm57",               :limit => 20
    t.string   "r58",                :limit => 20
    t.string   "rm58",               :limit => 20
    t.string   "r59",                :limit => 20
    t.string   "rm59",               :limit => 20
    t.string   "r60",                :limit => 20
    t.string   "rm60",               :limit => 20
    t.string   "r61",                :limit => 20
    t.string   "rm61",               :limit => 20
    t.string   "r62",                :limit => 20
    t.string   "rm62",               :limit => 20
    t.string   "r63",                :limit => 20
    t.string   "rm63",               :limit => 20
    t.string   "r64",                :limit => 20
    t.string   "rm64",               :limit => 20
    t.string   "r65",                :limit => 20
    t.string   "rm65",               :limit => 20
    t.string   "r66",                :limit => 20
    t.string   "rm66",               :limit => 20
    t.string   "r67",                :limit => 20
    t.string   "rm67",               :limit => 20
    t.string   "r68",                :limit => 20
    t.string   "rm68",               :limit => 20
    t.string   "r69",                :limit => 20
    t.string   "rm69",               :limit => 20
    t.string   "r70",                :limit => 20
    t.string   "rm70",               :limit => 20
    t.string   "r71",                :limit => 20
    t.string   "rm71",               :limit => 20
    t.string   "r72",                :limit => 20
    t.string   "rm72",               :limit => 20
    t.string   "r73",                :limit => 20
    t.string   "rm73",               :limit => 20
    t.string   "r74",                :limit => 20
    t.string   "rm74",               :limit => 20
    t.string   "r75",                :limit => 20
    t.string   "rm75",               :limit => 20
    t.string   "r76",                :limit => 20
    t.string   "rm76",               :limit => 20
    t.string   "r77",                :limit => 20
    t.string   "rm77",               :limit => 20
    t.string   "r78",                :limit => 20
    t.string   "rm78",               :limit => 20
    t.string   "r79",                :limit => 20
    t.string   "rm79",               :limit => 20
    t.string   "new_catalog_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_catalog_templates", ["catalog_number", "manufacturer"], :name => "index_price_catalog_templates_on_catalog_number_and_manufacturer"

  create_table "price_cost_templates", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 3
    t.string   "manufacturer",        :limit => 20
    t.string   "manufacturer_orig",   :limit => 20
    t.string   "catalog_number",      :limit => 20
    t.string   "catalog_number_orig", :limit => 20
    t.string   "country"
    t.string   "parts_group"
    t.integer  "supplier_id"
    t.integer  "price_setting_id"
    t.integer  "processed"
    t.string   "delivery_days_price"
    t.integer  "weight_grams"
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

  add_index "price_cost_templates", ["catalog_number", "manufacturer"], :name => "index_price_cost_templates_on_catalog_number_and_manufacturer"
  add_index "price_cost_templates", ["price_setting_id"], :name => "index_price_cost_templates_on_price_setting_id"

  create_table "price_import_templates", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.string   "title_en"
    t.integer  "count"
    t.decimal  "price_cost",                                  :precision => 10, :scale => 3
    t.string   "manufacturer"
    t.string   "manufacturer_orig"
    t.string   "catalog_number",                :limit => 20
    t.string   "catalog_number_orig",           :limit => 20
    t.string   "new_catalog_number",            :limit => 20
    t.string   "new_catalog_number_orig",       :limit => 20
    t.string   "country"
    t.string   "parts_group"
    t.string   "doublet"
    t.integer  "supplier_id"
    t.integer  "price_setting_id"
    t.boolean  "processed",                                                                  :default => false
    t.string   "delivery_days_price"
    t.integer  "weight_grams"
    t.string   "external_id"
    t.string   "unit_package"
    t.string   "multiply_factor"
    t.string   "min_order"
    t.string   "description"
    t.string   "unit"
    t.string   "applicability"
    t.string   "replacement",                   :limit => 20
    t.string   "replacement_orig",              :limit => 20
    t.string   "replacement_manufacturer",      :limit => 20
    t.string   "replacement_manufacturer_orig", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_settings", :force => true do |t|
    t.string   "title"
    t.integer  "currency_buy_id"
    t.float    "absolute_buy_rate"
    t.float    "relative_buy_rate"
    t.boolean  "visible_for_site"
    t.boolean  "visible_for_stock"
    t.boolean  "visible_for_shops"
    t.decimal  "retail_rate",             :precision => 20, :scale => 10
    t.float    "kilo_price"
    t.integer  "currency_weight_id"
    t.float    "relative_weight_rate"
    t.float    "absolute_weight_rate"
    t.boolean  "presence"
    t.string   "delivery_summary"
    t.string   "country"
    t.string   "country_short"
    t.float    "weight_unavailable_rate"
    t.integer  "delivery_days_declared"
    t.integer  "price_setting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_days_average"
    t.integer  "supplier_id"
    t.integer  "success_percent",                                         :default => 55
  end

  create_table "prices", :force => true do |t|
    t.integer  "job_id"
    t.integer  "goods_id"
    t.string   "title"
    t.string   "count"
    t.decimal  "price_cost",                        :precision => 10, :scale => 3
    t.string   "manufacturer",       :limit => 100
    t.string   "catalog_number",     :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "title_en"
    t.string   "manufacturer_short"
    t.string   "success_percent"
    t.string   "applicability"
    t.string   "unit"
    t.string   "description"
    t.string   "min_order"
    t.string   "multiply_factor"
    t.string   "unit_package"
    t.string   "external_id"
    t.string   "new_catalog_number"
    t.float    "weight_grams"
    t.string   "r0"
    t.string   "r1"
    t.string   "r2"
    t.string   "r3"
    t.string   "r4"
    t.string   "r5"
    t.string   "r6"
    t.string   "r7"
    t.string   "r8"
    t.string   "r9"
    t.string   "parts_group"
    t.string   "manufacturer_orig"
    t.string   "job_code",           :limit => 20
    t.integer  "supplier_id"
    t.string   "doublet"
    t.boolean  "processed",                                                        :default => false
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

  create_table "replace_jobs", :force => true do |t|
    t.integer  "r0_colnum"
    t.integer  "rm0_colnum"
    t.string   "rdm0",                      :limit => 20
    t.integer  "rdi0"
    t.string   "rde0",                      :limit => 1
    t.integer  "r1_colnum"
    t.integer  "rm1_colnum"
    t.string   "rdm1",                      :limit => 20
    t.integer  "rdi1"
    t.string   "rde1",                      :limit => 1
    t.integer  "r2_colnum"
    t.integer  "rm2_colnum"
    t.string   "rdm2",                      :limit => 20
    t.integer  "rdi2"
    t.string   "rde2",                      :limit => 1
    t.integer  "r3_colnum"
    t.integer  "rm3_colnum"
    t.string   "rdm3",                      :limit => 20
    t.integer  "rdi3"
    t.string   "rde3",                      :limit => 1
    t.integer  "r4_colnum"
    t.integer  "rm4_colnum"
    t.string   "rdm4",                      :limit => 20
    t.integer  "rdi4"
    t.string   "rde4",                      :limit => 1
    t.integer  "r5_colnum"
    t.integer  "rm5_colnum"
    t.string   "rdm5",                      :limit => 20
    t.integer  "rdi5"
    t.string   "rde5",                      :limit => 1
    t.integer  "r6_colnum"
    t.integer  "rm6_colnum"
    t.string   "rdm6",                      :limit => 20
    t.integer  "rdi6"
    t.string   "rde6",                      :limit => 1
    t.integer  "r7_colnum"
    t.integer  "rm7_colnum"
    t.string   "rdm7",                      :limit => 20
    t.integer  "rdi7"
    t.string   "rde7",                      :limit => 1
    t.integer  "r8_colnum"
    t.integer  "rm8_colnum"
    t.string   "rdm8",                      :limit => 20
    t.integer  "rdi8"
    t.string   "rde8",                      :limit => 1
    t.integer  "r9_colnum"
    t.integer  "rm9_colnum"
    t.string   "rdm9",                      :limit => 20
    t.integer  "rdi9"
    t.string   "rde9",                      :limit => 1
    t.integer  "r10_colnum"
    t.integer  "rm10_colnum"
    t.string   "rdm10",                     :limit => 20
    t.integer  "rdi10"
    t.string   "rde10",                     :limit => 1
    t.integer  "r11_colnum"
    t.integer  "rm11_colnum"
    t.string   "rdm11",                     :limit => 20
    t.integer  "rdi11"
    t.string   "rde11",                     :limit => 1
    t.integer  "r12_colnum"
    t.integer  "rm12_colnum"
    t.string   "rdm12",                     :limit => 20
    t.integer  "rdi12"
    t.string   "rde12",                     :limit => 1
    t.integer  "r13_colnum"
    t.integer  "rm13_colnum"
    t.string   "rdm13",                     :limit => 20
    t.integer  "rdi13"
    t.string   "rde13",                     :limit => 1
    t.integer  "r14_colnum"
    t.integer  "rm14_colnum"
    t.string   "rdm14",                     :limit => 20
    t.integer  "rdi14"
    t.string   "rde14",                     :limit => 1
    t.integer  "r15_colnum"
    t.integer  "rm15_colnum"
    t.string   "rdm15",                     :limit => 20
    t.integer  "rdi15"
    t.string   "rde15",                     :limit => 1
    t.integer  "r16_colnum"
    t.integer  "rm16_colnum"
    t.string   "rdm16",                     :limit => 20
    t.integer  "rdi16"
    t.string   "rde16",                     :limit => 1
    t.integer  "r17_colnum"
    t.integer  "rm17_colnum"
    t.string   "rdm17",                     :limit => 20
    t.integer  "rdi17"
    t.string   "rde17",                     :limit => 1
    t.integer  "r18_colnum"
    t.integer  "rm18_colnum"
    t.string   "rdm18",                     :limit => 20
    t.integer  "rdi18"
    t.string   "rde18",                     :limit => 1
    t.integer  "r19_colnum"
    t.integer  "rm19_colnum"
    t.string   "rdm19",                     :limit => 20
    t.integer  "rdi19"
    t.string   "rde19",                     :limit => 1
    t.integer  "r20_colnum"
    t.integer  "rm20_colnum"
    t.string   "rdm20",                     :limit => 20
    t.integer  "rdi20"
    t.string   "rde20",                     :limit => 1
    t.integer  "r21_colnum"
    t.integer  "rm21_colnum"
    t.string   "rdm21",                     :limit => 20
    t.integer  "rdi21"
    t.string   "rde21",                     :limit => 1
    t.integer  "r22_colnum"
    t.integer  "rm22_colnum"
    t.string   "rdm22",                     :limit => 20
    t.integer  "rdi22"
    t.string   "rde22",                     :limit => 1
    t.integer  "r23_colnum"
    t.integer  "rm23_colnum"
    t.string   "rdm23",                     :limit => 20
    t.integer  "rdi23"
    t.string   "rde23",                     :limit => 1
    t.integer  "r24_colnum"
    t.integer  "rm24_colnum"
    t.string   "rdm24",                     :limit => 20
    t.integer  "rdi24"
    t.string   "rde24",                     :limit => 1
    t.integer  "r25_colnum"
    t.integer  "rm25_colnum"
    t.string   "rdm25",                     :limit => 20
    t.integer  "rdi25"
    t.string   "rde25",                     :limit => 1
    t.integer  "r26_colnum"
    t.integer  "rm26_colnum"
    t.string   "rdm26",                     :limit => 20
    t.integer  "rdi26"
    t.string   "rde26",                     :limit => 1
    t.integer  "r27_colnum"
    t.integer  "rm27_colnum"
    t.string   "rdm27",                     :limit => 20
    t.integer  "rdi27"
    t.string   "rde27",                     :limit => 1
    t.integer  "r28_colnum"
    t.integer  "rm28_colnum"
    t.string   "rdm28",                     :limit => 20
    t.integer  "rdi28"
    t.string   "rde28",                     :limit => 1
    t.integer  "r29_colnum"
    t.integer  "rm29_colnum"
    t.string   "rdm29",                     :limit => 20
    t.integer  "rdi29"
    t.string   "rde29",                     :limit => 1
    t.integer  "r30_colnum"
    t.integer  "rm30_colnum"
    t.string   "rdm30",                     :limit => 20
    t.integer  "rdi30"
    t.string   "rde30",                     :limit => 1
    t.integer  "r31_colnum"
    t.integer  "rm31_colnum"
    t.string   "rdm31",                     :limit => 20
    t.integer  "rdi31"
    t.string   "rde31",                     :limit => 1
    t.integer  "r32_colnum"
    t.integer  "rm32_colnum"
    t.string   "rdm32",                     :limit => 20
    t.integer  "rdi32"
    t.string   "rde32",                     :limit => 1
    t.integer  "r33_colnum"
    t.integer  "rm33_colnum"
    t.string   "rdm33",                     :limit => 20
    t.integer  "rdi33"
    t.string   "rde33",                     :limit => 1
    t.integer  "r34_colnum"
    t.integer  "rm34_colnum"
    t.string   "rdm34",                     :limit => 20
    t.integer  "rdi34"
    t.string   "rde34",                     :limit => 1
    t.integer  "r35_colnum"
    t.integer  "rm35_colnum"
    t.string   "rdm35",                     :limit => 20
    t.integer  "rdi35"
    t.string   "rde35",                     :limit => 1
    t.integer  "r36_colnum"
    t.integer  "rm36_colnum"
    t.string   "rdm36",                     :limit => 20
    t.integer  "rdi36"
    t.string   "rde36",                     :limit => 1
    t.integer  "r37_colnum"
    t.integer  "rm37_colnum"
    t.string   "rdm37",                     :limit => 20
    t.integer  "rdi37"
    t.string   "rde37",                     :limit => 1
    t.integer  "r38_colnum"
    t.integer  "rm38_colnum"
    t.string   "rdm38",                     :limit => 20
    t.integer  "rdi38"
    t.string   "rde38",                     :limit => 1
    t.integer  "r39_colnum"
    t.integer  "rm39_colnum"
    t.string   "rdm39",                     :limit => 20
    t.integer  "rdi39"
    t.string   "rde39",                     :limit => 1
    t.integer  "r40_colnum"
    t.integer  "rm40_colnum"
    t.string   "rdm40",                     :limit => 20
    t.integer  "rdi40"
    t.string   "rde40",                     :limit => 1
    t.integer  "r41_colnum"
    t.integer  "rm41_colnum"
    t.string   "rdm41",                     :limit => 20
    t.integer  "rdi41"
    t.string   "rde41",                     :limit => 1
    t.integer  "r42_colnum"
    t.integer  "rm42_colnum"
    t.string   "rdm42",                     :limit => 20
    t.integer  "rdi42"
    t.string   "rde42",                     :limit => 1
    t.integer  "r43_colnum"
    t.integer  "rm43_colnum"
    t.string   "rdm43",                     :limit => 20
    t.integer  "rdi43"
    t.string   "rde43",                     :limit => 1
    t.integer  "r44_colnum"
    t.integer  "rm44_colnum"
    t.string   "rdm44",                     :limit => 20
    t.integer  "rdi44"
    t.string   "rde44",                     :limit => 1
    t.integer  "r45_colnum"
    t.integer  "rm45_colnum"
    t.string   "rdm45",                     :limit => 20
    t.integer  "rdi45"
    t.string   "rde45",                     :limit => 1
    t.integer  "r46_colnum"
    t.integer  "rm46_colnum"
    t.string   "rdm46",                     :limit => 20
    t.integer  "rdi46"
    t.string   "rde46",                     :limit => 1
    t.integer  "r47_colnum"
    t.integer  "rm47_colnum"
    t.string   "rdm47",                     :limit => 20
    t.integer  "rdi47"
    t.string   "rde47",                     :limit => 1
    t.integer  "r48_colnum"
    t.integer  "rm48_colnum"
    t.string   "rdm48",                     :limit => 20
    t.integer  "rdi48"
    t.string   "rde48",                     :limit => 1
    t.integer  "r49_colnum"
    t.integer  "rm49_colnum"
    t.string   "rdm49",                     :limit => 20
    t.integer  "rdi49"
    t.string   "rde49",                     :limit => 1
    t.integer  "r50_colnum"
    t.integer  "rm50_colnum"
    t.string   "rdm50",                     :limit => 20
    t.integer  "rdi50"
    t.string   "rde50",                     :limit => 1
    t.integer  "r51_colnum"
    t.integer  "rm51_colnum"
    t.string   "rdm51",                     :limit => 20
    t.integer  "rdi51"
    t.string   "rde51",                     :limit => 1
    t.integer  "r52_colnum"
    t.integer  "rm52_colnum"
    t.string   "rdm52",                     :limit => 20
    t.integer  "rdi52"
    t.string   "rde52",                     :limit => 1
    t.integer  "r53_colnum"
    t.integer  "rm53_colnum"
    t.string   "rdm53",                     :limit => 20
    t.integer  "rdi53"
    t.string   "rde53",                     :limit => 1
    t.integer  "r54_colnum"
    t.integer  "rm54_colnum"
    t.string   "rdm54",                     :limit => 20
    t.integer  "rdi54"
    t.string   "rde54",                     :limit => 1
    t.integer  "r55_colnum"
    t.integer  "rm55_colnum"
    t.string   "rdm55",                     :limit => 20
    t.integer  "rdi55"
    t.string   "rde55",                     :limit => 1
    t.integer  "r56_colnum"
    t.integer  "rm56_colnum"
    t.string   "rdm56",                     :limit => 20
    t.integer  "rdi56"
    t.string   "rde56",                     :limit => 1
    t.integer  "r57_colnum"
    t.integer  "rm57_colnum"
    t.string   "rdm57",                     :limit => 20
    t.integer  "rdi57"
    t.string   "rde57",                     :limit => 1
    t.integer  "r58_colnum"
    t.integer  "rm58_colnum"
    t.string   "rdm58",                     :limit => 20
    t.integer  "rdi58"
    t.string   "rde58",                     :limit => 1
    t.integer  "r59_colnum"
    t.integer  "rm59_colnum"
    t.string   "rdm59",                     :limit => 20
    t.integer  "rdi59"
    t.string   "rde59",                     :limit => 1
    t.integer  "r60_colnum"
    t.integer  "rm60_colnum"
    t.string   "rdm60",                     :limit => 20
    t.integer  "rdi60"
    t.string   "rde60",                     :limit => 1
    t.integer  "r61_colnum"
    t.integer  "rm61_colnum"
    t.string   "rdm61",                     :limit => 20
    t.integer  "rdi61"
    t.string   "rde61",                     :limit => 1
    t.integer  "r62_colnum"
    t.integer  "rm62_colnum"
    t.string   "rdm62",                     :limit => 20
    t.integer  "rdi62"
    t.string   "rde62",                     :limit => 1
    t.integer  "r63_colnum"
    t.integer  "rm63_colnum"
    t.string   "rdm63",                     :limit => 20
    t.integer  "rdi63"
    t.string   "rde63",                     :limit => 1
    t.integer  "r64_colnum"
    t.integer  "rm64_colnum"
    t.string   "rdm64",                     :limit => 20
    t.integer  "rdi64"
    t.string   "rde64",                     :limit => 1
    t.integer  "r65_colnum"
    t.integer  "rm65_colnum"
    t.string   "rdm65",                     :limit => 20
    t.integer  "rdi65"
    t.string   "rde65",                     :limit => 1
    t.integer  "r66_colnum"
    t.integer  "rm66_colnum"
    t.string   "rdm66",                     :limit => 20
    t.integer  "rdi66"
    t.string   "rde66",                     :limit => 1
    t.integer  "r67_colnum"
    t.integer  "rm67_colnum"
    t.string   "rdm67",                     :limit => 20
    t.integer  "rdi67"
    t.string   "rde67",                     :limit => 1
    t.integer  "r68_colnum"
    t.integer  "rm68_colnum"
    t.string   "rdm68",                     :limit => 20
    t.integer  "rdi68"
    t.string   "rde68",                     :limit => 1
    t.integer  "r69_colnum"
    t.integer  "rm69_colnum"
    t.string   "rdm69",                     :limit => 20
    t.integer  "rdi69"
    t.string   "rde69",                     :limit => 1
    t.integer  "r70_colnum"
    t.integer  "rm70_colnum"
    t.string   "rdm70",                     :limit => 20
    t.integer  "rdi70"
    t.string   "rde70",                     :limit => 1
    t.integer  "r71_colnum"
    t.integer  "rm71_colnum"
    t.string   "rdm71",                     :limit => 20
    t.integer  "rdi71"
    t.string   "rde71",                     :limit => 1
    t.integer  "r72_colnum"
    t.integer  "rm72_colnum"
    t.string   "rdm72",                     :limit => 20
    t.integer  "rdi72"
    t.string   "rde72",                     :limit => 1
    t.integer  "r73_colnum"
    t.integer  "rm73_colnum"
    t.string   "rdm73",                     :limit => 20
    t.integer  "rdi73"
    t.string   "rde73",                     :limit => 1
    t.integer  "r74_colnum"
    t.integer  "rm74_colnum"
    t.string   "rdm74",                     :limit => 20
    t.integer  "rdi74"
    t.string   "rde74",                     :limit => 1
    t.integer  "r75_colnum"
    t.integer  "rm75_colnum"
    t.string   "rdm75",                     :limit => 20
    t.integer  "rdi75"
    t.string   "rde75",                     :limit => 1
    t.integer  "r76_colnum"
    t.integer  "rm76_colnum"
    t.string   "rdm76",                     :limit => 20
    t.integer  "rdi76"
    t.string   "rde76",                     :limit => 1
    t.integer  "r77_colnum"
    t.integer  "rm77_colnum"
    t.string   "rdm77",                     :limit => 20
    t.integer  "rdi77"
    t.string   "rde77",                     :limit => 1
    t.integer  "r78_colnum"
    t.integer  "rm78_colnum"
    t.string   "rdm78",                     :limit => 20
    t.integer  "rdi78"
    t.string   "rde78",                     :limit => 1
    t.integer  "r79_colnum"
    t.integer  "rm79_colnum"
    t.string   "rdm79",                     :limit => 20
    t.integer  "rdi79"
    t.string   "rde79",                     :limit => 1
    t.integer  "catalog_number_colnum"
    t.integer  "manufacturer_colnum"
    t.string   "default_manufacturer",      :limit => 20
    t.integer  "weight_grams_colnum"
    t.integer  "new_catalog_number_colnum"
    t.float    "weight_coefficient"
    t.integer  "title_colnum"
    t.integer  "title_en_colnum"
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
    t.boolean  "buyer"
    t.boolean  "seller"
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
    t.string   "web_site"
    t.text     "description"
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
