# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130531005232) do

  create_table "historical_stock_quotes", :force => true do |t|
    t.string   "filename"
    t.string   "origin_code"
    t.date     "created_date"
    t.integer  "stock_quotes_qty"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "stock_quotes", :force => true do |t|
    t.date     "date"
    t.string   "bdi_code"
    t.string   "ticker_symbol"
    t.string   "market_type"
    t.string   "name"
    t.string   "specification"
    t.string   "currency_ref"
    t.decimal  "opening_price"
    t.decimal  "highest_price"
    t.decimal  "lowest_price"
    t.decimal  "average_price"
    t.decimal  "close_price"
    t.decimal  "best_purchase_price"
    t.decimal  "best_sell_price"
    t.decimal  "total_trading"
    t.decimal  "total_trading_share"
    t.decimal  "trading_volume"
    t.integer  "prazo_termo"
    t.integer  "historical_stock_quotes_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "stock_quotes", ["historical_stock_quotes_id"], :name => "index_stock_quotes_on_historical_stock_quotes_id"

end
