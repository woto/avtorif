# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100802094621) do

  create_table "analogues", :force => true do |t|
    t.integer  "original_id"
    t.integer  "analogue_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "csvs", :force => true do |t|
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
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "emails", :force => true do |t|
    t.string   "server"
    t.string   "address"
    t.string   "login"
    t.string   "password"
    t.string   "topic"
    t.string   "sender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "excels", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", :force => true do |t|
    t.string   "path"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ftps", :force => true do |t|
    t.string   "server"
    t.string   "path"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", :force => true do |t|
    t.integer  "price_id"
    t.integer  "contractor_id"
    t.string   "code"
    t.integer  "manufacturer_id"
    t.integer  "cost",            :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", :force => true do |t|
    t.integer  "price_id"
    t.integer  "importable_id"
    t.string   "importable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.datetime "next_start"
    t.datetime "last_start"
    t.string   "title"
    t.integer  "repeats_id"
    t.integer  "jobable_id"
    t.string   "jobable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs_repeats", :id => false, :force => true do |t|
    t.integer  "repeat_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.integer  "supplier_id"
    t.integer  "margin",      :limit => 10, :precision => 10, :scale => 0
    t.boolean  "original"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receives", :force => true do |t|
    t.integer  "price_id"
    t.integer  "receiveable_id"
    t.string   "receiveable_type"
    t.string   "file_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repeats", :force => true do |t|
    t.string   "cron_string"
    t.string   "title"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
