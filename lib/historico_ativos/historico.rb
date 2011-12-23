module HistoricoAtivos
  class Historico < ActiveRecord::Base
    set_table_name "historico_ativos"

    attr_accessor :nome_arquivo, :codigo_origem, :data_geracao

    has_many :ativos

    def import_header(header)
      @nome_arquivo = header.nome_arquivo
      @data_geracao = header.data_geracao
      @codigo_origem = header.codigo_origem
    end
  end
end
