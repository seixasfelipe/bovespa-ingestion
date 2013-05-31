module HistoricoAtivos
  class CarregaHistorico

    attr_accessor :parser_header, :parser_trailer, :parser_stock_quote

    def initialize(parser_header, parser_trailer, parser_stock_quote)
      @parser_header = parser_header
      @parser_trailer = parser_trailer
      @parser_stock_quote = parser_stock_quote
    end

    def load(filepath)
      return false unless File.exists?(filepath)
      
      file = File.open(filepath, "r")

      historico = Historico.new

      file.each { |line|
        historico.import_header @parser_header.parse(line) if line.start_with?("00")
        historico.stock_quotes << @parser_stock_quote.parse(line) if line.start_with?("01")
        historico.import_trailer @parser_trailer.parse(line) if line.start_with?("99")
      }

      historico
    end

    def persist(historico)
      historico.save
    end
  end
end
