require 'date'

module HistoricoAtivos
  class ParserHeader
    def parse(row)
      read_header row if row.start_with?("00")
    end

    def read_header(row)
      header = Header.new
      header.filename = read_filename row
      header.origin_code = read_origin_code row
      header.created_date = read_created_date row
      header
    end

    def read_filename(row)
      row[02..14].strip
    end

    def read_origin_code(row)
      row[15..22].strip
    end

    def read_created_date(row)
      year = row[23..26]
      month = row[27..28]
      day = row[29..30]
      Date.new(year.to_i, month.to_i, day.to_i)
    end 
  end
end
