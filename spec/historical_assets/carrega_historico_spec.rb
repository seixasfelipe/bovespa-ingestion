require 'spec_helper'

module HistoricoAtivos
  describe CarregaHistorico do

    before(:each) do
      @file = "sample/sample_cota_hist_2003.txt"
    end

    let(:parser_header) { double(ParserHeader).as_null_object }
    let(:parser_trailer) { double(ParserTrailer).as_null_object }
    let(:parser_ativo) {
      p_ativo = double(ParserAtivo).as_null_object
      p_ativo.stub(:parse).and_return(Ativo.new)
      p_ativo
    }

    let(:loader) { CarregaHistorico.new parser_header, parser_trailer, parser_ativo }
    let(:header) { double(Header).as_null_object }
    let(:trailer) { double(Trailer).as_null_object }

    it "deveria carregar o arquivo de exemplo" do
      File.exists?(@file).should be_true
    end

    it "deveria parsear header uma vez" do 
      parser_header.should_receive(:parse).once.and_return(Header.new)

      loader.load @file
    end

    it "deveria parsear trailer uma vez" do
      parser_trailer.should_receive(:parse).once.and_return(Trailer.new)

      loader.load @file
    end

    it "deveria parsear ativo duas vezes" do
      parser_ativo.should_receive(:parse).twice

      loader.load @file
    end

    it "deveria retornar dois ativos ao carregar o arquivo" do
      loader = CarregaHistorico.new parser_header, parser_trailer, ParserAtivo.new

      historico = loader.load @file
      
      historico.ativos.size.should == 2
      historico.ativos[0].codigo.should == "VALE3"
      historico.ativos[1].codigo.should == "VALE5T"
    end

    it "deveria importar o header ao carregar o arquivo" do
      header.stub(:nome_arquivo).and_return("COTAHIST.2003")
      parser_header.stub(:parse).and_return(header)

      historico = loader.load @file
      historico.nome_arquivo.should == "COTAHIST.2003"
    end

    it "deveria importar o trailer ao carregar o arquivo" do
      trailer.stub(:quantidade_ativos).and_return(553)
      parser_trailer.stub(:parse).and_return(trailer)

      historico = loader.load @file
      historico.quantidade_ativos.should == 553
    end

    it "deveria persistir o historico" do
      historico = double(Historico).as_null_object
      historico.should_receive(:save).once

      loader.persist historico
    end
  end
end
