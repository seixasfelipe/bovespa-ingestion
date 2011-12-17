require 'spec_helper'

module HistoricoAtivos
  describe CarregaHistorico do

    before(:each) do
      @file = "sample/sample_cota_hist_2003.txt"
      @parser_h_mock = double(ParserHeader).as_null_object
      @parser_t_mock = double(ParserTrailer).as_null_object
      @parser_a_mock = double(ParserAtivo).as_null_object
    end

    it "deveria carregar o arquivo de exemplo" do
      File.exists?(@file).should be_true
    end

    it "deveria parsear header uma vez" do 
      @parser_h_mock.should_receive(:parse).once
      loader = CarregaHistorico.new @parser_h_mock, @parser_t_mock, @parser_a_mock
      loader.load @file
    end

    it "deveria parsear trailer uma vez" do
      @parser_t_mock.should_receive(:parse).once

      loader = CarregaHistorico.new @parser_h_mock, @parser_t_mock, @parser_a_mock
      loader.load @file
    end

    it "deveria parsear ativo duas vezes" do
      @parser_a_mock.should_receive(:parse).twice

      loader = CarregaHistorico.new @parser_h_mock, @parser_t_mock, @parser_a_mock
      loader.load @file
    end

    it "deveria retornar dois ativos ao carregar o arquivo" do
      loader = CarregaHistorico.new @parser_h_mock, @parser_t_mock, @parser_a_mock
      historico = loader.load @file
      historico.ativos.size.should == 2
      historico.ativos[0].codigo.should == "VALE3"
      historico.ativos[1].codigo.should == "VALE5T"
    end
  end
end
