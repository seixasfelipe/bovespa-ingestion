require 'spec_helper'

module HistoricQuotes
  describe HistoricalStockQuote do

    let(:header) {
      header = Header.new
      header.filename = "COTA.HIST2003"
      header.origin_code = "BOVESPA"
      header.created_date = Date.new(2004, 05, 31)
      header
    }

    let(:trailer) {
      trailer = Trailer.new
      trailer.stock_quotes_qty = 553
      trailer
    }

    let(:historico) { HistoricalStockQuote.new }

    it "should load header data" do
      historico.import_header header

      historico.filename.should == "COTA.HIST2003"
      historico.origin_code.should == "BOVESPA"
      historico.created_date.to_s.should eql Date.new(2004, 05, 31).to_s
    end

    it "should load trailer data" do
      historico.import_trailer trailer

      historico.stock_quotes_qty == 553
    end

    it "should be activerecord type" do
      historico.should be_kind_of(ActiveRecord::Base)
    end
  end
end
