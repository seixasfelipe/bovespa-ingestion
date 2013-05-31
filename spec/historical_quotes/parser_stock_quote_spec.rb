require 'spec_helper'

module HistoricQuotes
  describe ParserStockQuote do
    before(:each) do
      sample_row = "012003021202VALE3      |010VALE R DOCE|ON       |  1R$ |000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"
      parser = ParserStockQuote.new
      @stock_quote = parser.parse sample_row
    end

    it "should return nil if line does not start with 01" do
      sample_row = "052003021202VALE3      |010VALE R DOCE|ON       |  1R$ |000000001050100000000105010000000010250000000001036800000000103210000000010321000000001043800142000000000000069500000000000720641400000000000000009999123100000010000000000000BRVALEACNOR0159"
      parser = ParserStockQuote.new
      stock_quote = parser.parse sample_row

      stock_quote.should be_nil
    end

    it "should extract stock quotes with a date" do
      @stock_quote.date.to_s.should eql Date.new(2003, 2, 12).to_s
    end

    it "should extract stock quotes with code BDI" do
      @stock_quote.bdi_code.should == 02
    end
    
    it "should extract stock quotes having code" do
      @stock_quote.ticker_symbol.should == "VALE3      |"
    end
    
    it "should extract stock quotes having market type" do
      @stock_quote.market_type.should == 10
    end

    it "should extract stock quotes with name" do
      @stock_quote.name.should == "VALE R DOCE|"
    end

    it "should extract stock quotes with specification" do
      @stock_quote.specification.should == "ON       |"
    end

    it "should extract stock quotes having due dates from the market" do
      @stock_quote.prazo_termo.should == 1
    end

    it "should extract stock quotes having currency reference" do
      @stock_quote.currency_ref.should == "R$ |"
    end

    it "should extract stock quotes having opening price" do
      @stock_quote.opening_price.should == 105.01
    end

    it "should extract stock quotes having maximum price" do
      @stock_quote.highest_price.should == 105.01
    end

    it "should extract stock quotes having mininum prices" do
      @stock_quote.lowest_price.should == 102.50
    end

    it "should extract stock quotes having average price" do
      @stock_quote.average_price.should == 103.68
    end

    it "should extract stock quotes having close price" do
      @stock_quote.close_price.should == 103.21
    end

    it "should extract stock quotes having best purchase price" do
      @stock_quote.best_purchase_price.should == 103.21
    end

    it "should extract stock quotes having best selling price" do
      @stock_quote.best_sell_price.should == 104.38
    end

    it "should extract stock quotes having total trading" do
      @stock_quote.total_trading.should == 142
    end

    it "should extract stock quotes having total trading shares" do
      @stock_quote.total_trading_share.should == 69500
    end

    it "should extract stock quotes having trading volume" do
      @stock_quote.trading_volume.should == 720641400
    end
  end
end
