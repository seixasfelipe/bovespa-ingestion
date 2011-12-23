module HistoricoAtivos
  class Ativo < ActiveRecord::Base
    belongs_to :historico

  end
end
