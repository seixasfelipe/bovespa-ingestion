require 'spec_helper'

module HistoricQuotes
  describe ParserTrailer do
    before(:each) do
      sample_row = "99COTAHIST.2003BOVESPA 2004053199999999999  "
      parser = ParserTrailer.new
      @trailer = parser.parse sample_row
    end

    it "should return nil if the line does not start with 99" do
      sample_row = "50COTAHIST.2003BOVESPA 2004053100000000553  "
      parser = ParserTrailer.new
      trailer = parser.parse sample_row

      trailer.should be_nil
    end

    it "should extract number of stock quotes in the file" do
      @trailer.stock_quotes_qty.should == 99999999999
    end
  end
end

