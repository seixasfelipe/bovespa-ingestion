module HistoricoAtivos
  class Historico < ActiveRecord::Base
    self.table_name = "historical_assets"

    has_many :ativos

    def import_header(header)
      self.filename = header.filename
      self.data_geracao = header.data_geracao
      self.origin_code = header.origin_code
    end

    def import_trailer(trailer)
      self.quantidade_ativos = trailer.quantidade_ativos
    end
  end
end
