module HistoricoAtivos
  class Historico
    attr_accessor :nome_arquivo, :codigo_origem, :data_geracao, :ativos

    def initialize
      @ativos = Array.new
    end

    def import_header(header)
      @nome_arquivo = header.nome_arquivo
      @data_geracao = header.data_geracao
      @codigo_origem = header.codigo_origem
    end
  end
end
