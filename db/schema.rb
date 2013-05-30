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

ActiveRecord::Schema.define(:version => 20111223214919) do

  create_table "ativos", :force => true do |t|
    t.date     "data"
    t.string   "bdi_code"
    t.string   "code"
    t.string   "market_type"
    t.string   "name"
    t.string   "spec"
    t.string   "currency_ref"
    t.decimal  "opening_price"
    t.decimal  "preco_maximo"
    t.decimal  "preco_minimo"
    t.decimal  "preco_medio"
    t.decimal  "preco_ultimo"
    t.decimal  "preco_melhor_oferta_compra"
    t.decimal  "preco_melhor_oferta_venda"
    t.decimal  "total_negocios"
    t.decimal  "quantidade_titulos_negociados"
    t.decimal  "volume_negocios"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "historico_id"
    t.integer  "prazo_termo"
  end

  add_index "ativos", ["historico_id"], :name => "index_ativos_on_historico_id"

  create_table "historical_assets", :force => true do |t|
    t.string   "filename"
    t.string   "origin_code"
    t.date     "created_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "quantidade_ativos"
  end

end
