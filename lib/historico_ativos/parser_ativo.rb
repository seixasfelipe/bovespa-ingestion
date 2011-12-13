require 'date'
require 'bigdecimal'

module HistoricoAtivos
  class ParserAtivo
    def parse(row)
      ativo = Ativo.new
      ativo.data = read_data row
      ativo.codigo_bdi = read_codigo_bdi row
      ativo.codigo = read_codigo row
      ativo.tipo_mercado = read_tipo_mercado row
      ativo.nome = read_nome row
      ativo.especificacao = read_especificacao row
      ativo.prazo_termo = read_prazo_termo row
      ativo.moeda_referencia = read_moeda_referencia row
      ativo.preco_abertura = read_preco_abertura row
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
      preco = row[56..68].to_i
      preco_s = preco.to_s
      preco_s.insert(preco_s.size - 2, '.')
      BigDecimal.new(preco_s)
    end

  end
end
