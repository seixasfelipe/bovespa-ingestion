require 'spec_helper'

module HistoricoAtivos
  describe StockQuote do

    it "should be an activerecord" do
      stock_quote = StockQuote.new
      stock_quote.should be_kind_of(ActiveRecord::Base)
    end

  end
end
