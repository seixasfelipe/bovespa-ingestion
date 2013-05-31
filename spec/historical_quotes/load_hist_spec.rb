require 'spec_helper'

module HistoricQuotes
  describe LoadHist do

    before(:each) do
      @file = "sample/sample_cota_hist_2003.txt"
    end

    let(:parser_header) { double(ParserHeader).as_null_object }
    let(:parser_trailer) { double(ParserTrailer).as_null_object }
    let(:parser_stock_quote) {
      p_stock_quote = double(ParserStockQuote).as_null_object
      p_stock_quote.stub(:parse).and_return(StockQuote.new)
      p_stock_quote
    }

    let(:loader) { LoadHist.new parser_header, parser_trailer, parser_stock_quote }
    let(:header) { double(Header).as_null_object }
    let(:trailer) { double(Trailer).as_null_object }

    it "should load example file" do
      File.exists?(@file).should be_true
    end

    it "should parse the header only one time" do 
      parser_header.should_receive(:parse).once.and_return(Header.new)

      loader.load @file
    end

    it "should parse the trailer only one time" do
      parser_trailer.should_receive(:parse).once.and_return(Trailer.new)

      loader.load @file
    end

    it "should parse quotes two times" do
      parser_stock_quote.should_receive(:parse).twice

      loader.load @file
    end

    it "should return two stock quotes after reading the file" do
      loader = LoadHist.new parser_header, parser_trailer, ParserStockQuote.new

      historico = loader.load @file
      
      historico.stock_quotes.size.should == 2
      historico.stock_quotes[0].ticker_symbol.should == "VALE3"
      historico.stock_quotes[1].ticker_symbol.should == "VALE5T"
    end

    it "should load header after reading the file" do
      header.stub(:filename).and_return("COTAHIST.2003")
      parser_header.stub(:parse).and_return(header)

      historico = loader.load @file
      historico.filename.should == "COTAHIST.2003"
    end

    it "should load trailer after reading the file" do
      trailer.stub(:stock_quotes_qty).and_return(553)
      parser_trailer.stub(:parse).and_return(trailer)

      historico = loader.load @file
      historico.stock_quotes_qty.should == 553
    end

    it "should persists historical data" do
      historico = double(HistoricalStockQuote).as_null_object
      historico.should_receive(:save).once

      loader.persist historico
    end
  end
end
