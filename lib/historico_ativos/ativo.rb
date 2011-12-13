module HistoricoAtivos
  class Ativo
    attr_accessor :data, :codigo_bdi, :codigo, :tipo_mercado,
      :nome, :especificacao, :prazo_termo, :moeda_referencia,
      :preco_abertura
  end
end
