module HistoricoAtivos
  class StockQuote < ActiveRecord::Base
    self.table_name = "stock_quotes"
    
    belongs_to :historical_stock_quote

  end
end
