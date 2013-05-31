require 'spec_helper'

module HistoricQuotes
  describe ParserHeader do
    before(:each) do
      sample_row = "00COTAHIST.2003BOVESPA 20040531                                                                                                                                                                                                                      "
      parser = ParserHeader.new
      @header = parser.parse sample_row
    end

    it "should return nil if the line does not start with 00" do
      sample_row = "05COTAHIST.2003BOVESPA 20040531                                                                                                                                                                                                                      "
      parser = ParserHeader.new
      header = parser.parse sample_row

      header.should be_nil
    end

    it "should extract header filename" do
      @header.filename.should == "COTAHIST.2003"
    end

    it "should extract header origin code" do
      @header.origin_code.should == "BOVESPA"
    end
    
    it "should extract header created date" do
      @header.created_date.to_s.should eql Date.new(2004, 05, 31).to_s 
    end
  end
end
