require 'date'
require 'bigdecimal'

module HistoricoAtivos
  class ParserAtivo
    def parse(row)
      read_ativo(row) if row.start_with?("01")
    end
    
    def read_ativo(row)
      ativo = Ativo.new
      ativo.date = read_data row
      ativo.codigo_bdi = read_codigo_bdi row
      ativo.codigo = read_codigo row
      ativo.tipo_mercado = read_tipo_mercado row
      ativo.nome = read_nome row
      ativo.especificacao = read_especificacao row
      ativo.prazo_termo = read_prazo_termo row
      ativo.moeda_referencia = read_moeda_referencia row
      ativo.preco_abertura = read_preco_abertura row
      ativo.preco_maximo = read_preco_maximo row
      ativo.preco_minimo = read_preco_minimo row
      ativo.preco_medio = read_preco_medio row
      ativo.preco_ultimo = read_preco_ultimo row
      ativo.preco_melhor_oferta_compra = read_preco_melhor_oferta_compra row
      ativo.preco_melhor_oferta_venda = read_preco_melhor_oferta_venda row
      ativo.total_negocios = read_total_negocios row
      ativo.quantidade_titulos_negociados= read_quantidade_titulos_negociados row
      ativo.volume_negocios = read_volume_negocios row
      ativo
    end

    def read_data(row)
      year = row[2..5]
      month = row[6..7]
      day = row[8..9]
      Date.new(year.to_i, month.to_i, day.to_i)
    end

    def read_codigo_bdi(row)
      row[10..11].to_i
    end

    def read_codigo(row)
      row[12..23].strip
    end

    def read_tipo_mercado(row)
      row[24..26].to_i
    end

    def read_nome(row)
      row[27..38].strip
    end

    def read_especificacao(row)
      row[39..48].strip
    end

    def read_prazo_termo(row)
      row[49..51].to_i
    end

    def read_moeda_referencia(row)
      row[52..55].strip
    end

    def read_preco_abertura(row)
      converts_to_big_decimal row[56..68].to_i
    end

    def read_preco_maximo(row)
      converts_to_big_decimal row[69..81].to_i
    end

    def read_preco_minimo(row)
      converts_to_big_decimal row[82..94].to_i
    end

    def read_preco_medio(row)
      converts_to_big_decimal row[95..107].to_i
    end
    
    def read_preco_ultimo(row)
      converts_to_big_decimal row[108..120].to_i
    end
    
    def read_preco_melhor_oferta_compra(row)
      converts_to_big_decimal row[121..133].to_i
    end
    
    def read_preco_melhor_oferta_venda(row)
      converts_to_big_decimal row[134..146].to_i
    end
    
    def read_total_negocios(row)
      row[147..151].to_i
    end
    
    def read_quantidade_titulos_negociados(row)
      BigDecimal.new(row[152..169])
    end
    
    def read_volume_negocios(row)
      BigDecimal.new(row[170..187])
    end
    
    def converts_to_big_decimal(preco)
      preco_s = preco.to_s
      preco_s.insert(preco_s.size - 2, '.')
      BigDecimal.new(preco_s)
    end
  end
end
