require 'spec_helper'

module HistoricoAtivos
  describe ParserAtivo do

    it "deveria extrair ativo contendo data pertencente a linha lida" do
      sample_row = "012003021202VALE3       010VALE R DOCE ON           R$  000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"      
      parser = ParserAtivo.new
      ativo = parser.parse sample_row

      ativo.data.to_s.should eql Date.new(2003, 2, 12).to_s
    end

    it "deveria extrair ativo contendo codigo BDI pertencente a linha lida" do
      sample_row = "012003021202VALE3       010VALE R DOCE ON           R$  000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"      
      parser = ParserAtivo.new
      ativo = parser.parse sample_row

      ativo.codigo_bdi.should == 02
    end
    
    it "deveria extrair ativo contendo codigo pertencente a linha lida" do
      sample_row = "012003021202VALE3VALE3V|VALE3010VALE R DOCE ON           R$  000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"      
      parser = ParserAtivo.new
      ativo = parser.parse sample_row

      ativo.codigo.should == "VALE3VALE3V|"
    end
  end
end
