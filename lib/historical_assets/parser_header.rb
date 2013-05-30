require 'date'

module HistoricoAtivos
  class ParserHeader
    def parse(row)
      read_header row if row.start_with?("00")
    end

    def read_header(row)
      header = Header.new
      header.filename = read_filename row
      header.codigo_origem = read_codigo_origem row
      header.data_geracao = read_data_geracao row
      header
    end

    def read_filename(row)
      row[02..14].strip
    end

    def read_codigo_origem(row)
      row[15..22].strip
    end

    def read_data_geracao(row)
      year = row[23..26]
      month = row[27..28]
      day = row[29..30]
      Date.new(year.to_i, month.to_i, day.to_i)
    end 
  end
end
