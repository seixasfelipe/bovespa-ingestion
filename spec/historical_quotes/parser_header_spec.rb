require 'spec_helper'

module HistoricQuotes
  describe ParserHeader do
    before(:each) do
      sample_row = "00COTAHIST.2003BOVESPA 20040531                                                                                                                                                                                                                      "
      parser = ParserHeader.new
      @header = parser.parse sample_row
    end

    it "deveria retornar nil se a linha nao comecar com 00" do
      sample_row = "05COTAHIST.2003BOVESPA 20040531                                                                                                                                                                                                                      "
      parser = ParserHeader.new
      header = parser.parse sample_row

      header.should be_nil
    end

    it "deveria extrair header contendo o name do arquivo lido" do
      @header.filename.should == "COTAHIST.2003"
    end

    it "deveria extrair header contendo code origem" do
      @header.origin_code.should == "BOVESPA"
    end
    
    it "deveria extrair header contendo a data de geracao do arquivo" do
      @header.created_date.to_s.should eql Date.new(2004, 05, 31).to_s 
    end
  end
end
