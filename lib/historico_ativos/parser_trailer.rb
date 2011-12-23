module HistoricoAtivos
  class ParserTrailer
    def parse(row)
      read_trailer row if row.start_with?("99")
    end

    def read_trailer(row)
      trailer = Trailer.new
      trailer.quantidade_ativos = read_quantidade_ativos row
      trailer
    end

    def read_quantidade_ativos(row)
      total = row[31..41].to_i
    end
  end
end
