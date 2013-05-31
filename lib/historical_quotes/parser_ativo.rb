require 'date'
require 'bigdecimal'

module HistoricQuotes
  class ParserStockQuote
    def parse(row)
      read_stock_quote(row) if row.start_with?("01")
    end
    
    def read_stock_quote(row)
      stock_quote = StockQuote.new
      stock_quote.date = read_data row
      stock_quote.bdi_code = read_bdi_code row
      stock_quote.ticker_symbol = read_ticker_symbol row
      stock_quote.market_type = read_market_type row
      stock_quote.name = read_name row
      stock_quote.specification = read_specification row
      stock_quote.prazo_termo = read_prazo_termo row
      stock_quote.currency_ref = read_currency_ref row
      stock_quote.opening_price = read_opening_price row
      stock_quote.highest_price = read_highest_price row
      stock_quote.lowest_price = read_lowest_price row
      stock_quote.average_price = read_average_price row
      stock_quote.close_price = read_close_price row
      stock_quote.best_purchase_price = read_best_purchase_price row
      stock_quote.best_sell_price = read_best_sell_price row
      stock_quote.total_trading = read_total_trading row
      stock_quote.total_trading_share= read_total_trading_share row
      stock_quote.trading_volume = read_trading_volume row
      stock_quote
    end

    def read_data(row)
      year = row[2..5]
      month = row[6..7]
      day = row[8..9]
      Date.new(year.to_i, month.to_i, day.to_i)
    end

    def read_bdi_code(row)
      row[10..11].to_i
    end

    def read_ticker_symbol(row)
      row[12..23].strip
    end

    def read_market_type(row)
      row[24..26].to_i
    end

    def read_name(row)
      row[27..38].strip
    end

    def read_specification(row)
      row[39..48].strip
    end

    def read_prazo_termo(row)
      row[49..51].to_i
    end

    def read_currency_ref(row)
      row[52..55].strip
    end

    def read_opening_price(row)
      converts_to_big_decimal row[56..68].to_i
    end

    def read_highest_price(row)
      converts_to_big_decimal row[69..81].to_i
    end

    def read_lowest_price(row)
      converts_to_big_decimal row[82..94].to_i
    end

    def read_average_price(row)
      converts_to_big_decimal row[95..107].to_i
    end
    
    def read_close_price(row)
      converts_to_big_decimal row[108..120].to_i
    end
    
    def read_best_purchase_price(row)
      converts_to_big_decimal row[121..133].to_i
    end
    
    def read_best_sell_price(row)
      converts_to_big_decimal row[134..146].to_i
    end
    
    def read_total_trading(row)
      row[147..151].to_i
    end
    
    def read_total_trading_share(row)
      BigDecimal.new(row[152..169])
    end
    
    def read_trading_volume(row)
      BigDecimal.new(row[170..187])
    end
    
    def converts_to_big_decimal(price)
      price_s = price.to_s
      price_s.insert(price_s.size - 2, '.')
      BigDecimal.new(price_s)
    end
  end
end
