require 'date'

module HistoricoAtivos
  class ParserAtivo
    def parse(row)
      ativo = Ativo.new
      ativo.data = read_data row
      ativo.codigo_bdi = read_codigo_bdi row
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

  end
end
