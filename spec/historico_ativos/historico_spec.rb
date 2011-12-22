require 'spec_helper'
require 'active_record'

module HistoricoAtivos
  describe Historico do

    let(:header) {
      header = Header.new
      header.nome_arquivo = "COTA.HIST2003"
      header.codigo_origem = "BOVESPA"
      header.data_geracao = Date.new(2004, 05, 31)
      header
    }

    it "deveria carregar dados contidos no header" do
      historico = Historico.new
      historico.import_header header

      historico.nome_arquivo.should == "COTA.HIST2003"
      historico.codigo_origem.should == "BOVESPA"
      historico.data_geracao.to_s.should eql Date.new(2004, 05, 31).to_s
    end

    it "deveria ser activerecord" do
      historico = Historico.new
      historico.should be_kind_of(ActiveRecord::Base)
    end
  end
end
