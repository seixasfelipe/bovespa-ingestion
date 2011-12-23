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

ActiveRecord::Schema.define(:version => 20111223131703) do

  create_table "ativos", :force => true do |t|
    t.date     "data"
    t.string   "codigo_bdi"
    t.string   "codigo"
    t.string   "tipo_mercado"
    t.string   "nome"
    t.string   "especificacao"
    t.string   "moeda_referencia"
    t.decimal  "preco_abertura"
    t.decimal  "preco_maximo"
    t.decimal  "preco_minimo"
    t.decimal  "preco_medio"
    t.decimal  "preco_ultimo"
    t.decimal  "preco_melhor_oferta_compra"
    t.decimal  "preco_melhor_oferta_venda"
    t.decimal  "total_negocios"
    t.decimal  "quantidade_titulos_negociados"
    t.decimal  "volume_negocios"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "historico_ativo_id"
    t.integer  "prazo_termo"
  end

  add_index "ativos", ["historico_ativo_id"], :name => "index_ativos_on_historico_ativo_id"

  create_table "historico_ativos", :force => true do |t|
    t.string   "nome_arquivo"
    t.string   "codigo_origem"
    t.date     "data_geracao"
    t.date     "data_importacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantidade_ativos"
  end

end
