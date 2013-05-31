module HistoricoAtivos
  class Ativo < ActiveRecord::Base
    self.table_name = "stock_quotes"
    
    belongs_to :historico

  end
end
