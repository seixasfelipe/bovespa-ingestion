class CreateHistorico < ActiveRecord::Migration
  def self.up
    create_table :historico_ativos do |t|
      t.string :nome_arquivo
      t.string :codigo_origem
      t.date :data_geracao
      t.date :data_importacao
      t.timestamps
    end
  end

  def self.down
    drop_table :historico_ativos
  end
end
