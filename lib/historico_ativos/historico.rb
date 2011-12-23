module HistoricoAtivos
  class Historico < ActiveRecord::Base
    set_table_name "historico_ativos"

    has_many :ativos

    def import_header(header)
      self.nome_arquivo = header.nome_arquivo
      self.data_geracao = header.data_geracao
      self.codigo_origem = header.codigo_origem
    end

    def import_trailer(trailer)
      self.quantidade_ativos = trailer.quantidade_ativos
    end
  end
end
