module HistoricoAtivos
  class CarregaHistorico

    attr_accessor :parser_header, :parser_trailer, :parser_ativo

    def initialize(parser_header, parser_trailer, parser_ativo)
      @parser_header = parser_header
      @parser_trailer = parser_trailer
      @parser_ativo = parser_ativo
    end

    def load(filepath)
      return false unless File.exists?(filepath)
      
      file = File.open(filepath, "r")

      file.each { |line|
         @parser_header.parse(line) if line.start_with?("00")
         @parser_ativo.parse(line) if line.start_with?("01")
         @parser_trailer.parse(line) if line.start_with?("99")
      }
    end
  end
end
