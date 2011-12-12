require 'spec_helper'

module HistoricoAtivos
  describe ParserAtivo do
    before(:each) do
      sample_row = "012003021202VALE3      |010VALE R DOCE|ON           |R$  000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"
      parser = ParserAtivo.new
      @ativo = parser.parse sample_row
    end

    it "deveria extrair ativo contendo data" do
      @ativo.data.to_s.should eql Date.new(2003, 2, 12).to_s
    end

    it "deveria extrair ativo contendo codigo BDI" do
      @ativo.codigo_bdi.should == 02
    end
    
    it "deveria extrair ativo contendo codigo" do
      @ativo.codigo.should == "VALE3      |"
    end
    
    it "deveria extrair ativo contendo tipo de mercado" do
      @ativo.tipo_mercado.should == 10
    end

    it "deveria extrair ativo contendo nome" do
      @ativo.nome.should == "VALE R DOCE|"
    end
  end
end
