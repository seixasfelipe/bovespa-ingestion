require 'spec_helper'

module HistoricoAtivos
  describe ParserAtivo do
    before(:each) do
      sample_row = "012003021202VALE3      |010VALE R DOCE|ON       |  1R$ |000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"
      parser = ParserAtivo.new
      @ativo = parser.parse sample_row
    end

    it "deveria retornar nil se a linha nao comecar com 01" do
      sample_row = "052003021202VALE3      |010VALE R DOCE|ON       |  1R$ |000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"
      parser = ParserAtivo.new
      ativo = parser.parse sample_row

      ativo.should be_nil
    end

    it "deveria extrair ativo contendo data" do
      @ativo.date.to_s.should eql Date.new(2003, 2, 12).to_s
    end

    it "deveria extrair ativo contendo code BDI" do
      @ativo.bdi_code.should == 02
    end
    
    it "deveria extrair ativo contendo code" do
      @ativo.code.should == "VALE3      |"
    end
    
    it "deveria extrair ativo contendo tipo de mercado" do
      @ativo.market_type.should == 10
    end

    it "deveria extrair ativo contendo nome" do
      @ativo.nome.should == "VALE R DOCE|"
    end

    it "deveria extrair ativo contendo especificacao" do
      @ativo.especificacao.should == "ON       |"
    end

    it "deveria extrair ativo contendo prazo em dias do mercado a termo" do
      @ativo.prazo_termo.should == 1
    end

    it "deveria extrair ativo contendo moeda de referencia" do
      @ativo.moeda_referencia.should == "R$ |"
    end

    it "deveria extrair ativo contendo preco de abertura" do
      @ativo.preco_abertura.should == 105.01
    end

    it "deveria extrair ativo contendo preco maximo" do
      @ativo.preco_maximo.should == 105.01
    end

    it "deveria extrair ativo contendo preco minimo" do
      @ativo.preco_minimo.should == 102.50
    end

    it "deveria extrair ativo contendo preco medio" do
      @ativo.preco_medio.should == 103.68
    end

    it "deveria extrair ativo contendo preco ultimo" do
      @ativo.preco_ultimo.should == 103.21
    end

    it "deveria extrair ativo contendo preco da melhor oferta de compra" do
      @ativo.preco_melhor_oferta_compra.should == 103.21
    end

    it "deveria extrair ativo contendo preco da melhor oferta de venda" do
      @ativo.preco_melhor_oferta_venda.should == 104.38
    end

    it "deveria extrair ativo contendo total de negocios" do
      @ativo.total_negocios.should == 142
    end

    it "deveria extrair ativo contendo quantidade de titulos negociados" do
      @ativo.quantidade_titulos_negociados.should == 69500
    end

    it "deveria extrair ativo contendo volume de negocios" do
      @ativo.volume_negocios.should == 720641400
    end
  end
end
