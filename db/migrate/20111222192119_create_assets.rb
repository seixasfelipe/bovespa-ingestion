class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :ativos do |t|
      t.date :date
      t.string :bdi_code
      t.string :code
      t.string :market_type
      t.string :name
      t.string :spec
      t.string :currency_ref
      t.decimal :opening_price
      t.decimal :preco_maximo
      t.decimal :preco_minimo
      t.decimal :preco_medio
      t.decimal :preco_ultimo
      t.decimal :preco_melhor_oferta_compra
      t.decimal :preco_melhor_oferta_venda
      t.decimal :total_negocios
      t.decimal :quantidade_titulos_negociados
      t.decimal :volume_negocios
      t.timestamps
    end
  end

  def self.down
    drop_table :ativos
  end
end
