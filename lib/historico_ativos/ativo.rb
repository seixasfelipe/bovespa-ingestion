module HistoricoAtivos
  class Ativo
    attr_accessor :data, :codigo_bdi, :codigo, :tipo_mercado,
      :nome, :especificacao, :prazo_termo, :moeda_referencia,
      :preco_abertura, :preco_maximo, :preco_minimo, :preco_medio,
      :preco_ultimo, :preco_melhor_oferta_compra, :preco_melhor_oferta_venda,
      :total_negocios, :quantidade_titulos_negociados, :volume_negocios
  end
end
