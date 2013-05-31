module HistoricQuotes
  class ParserTrailer
    def parse(row)
      read_trailer row if row.start_with?("99")
    end

    def read_trailer(row)
      trailer = Trailer.new
      trailer.stock_quotes_qty = read_stock_quotes_qty row
      trailer
    end

    def read_stock_quotes_qty(row)
      total = row[31..41].to_i
    end
  end
end
