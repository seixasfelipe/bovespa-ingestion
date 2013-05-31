module HistoricoAtivos
  class Historico < ActiveRecord::Base
    self.table_name = "historical_stock_quotes"

    has_many :stock_quotes

    def import_header(header)
      self.filename = header.filename
      self.created_date = header.created_date
      self.origin_code = header.origin_code
    end

    def import_trailer(trailer)
      self.stock_quotes_qty = trailer.stock_quotes_qty
    end
  end
end
