require 'date'
require 'bigdecimal'

module HistoricoAtivos
  class ParserAtivo
    def parse(row)
      read_ativo(row) if row.start_with?("01")
    end
    
    def read_ativo(row)
      ativo = Ativo.new
      ativo.date = read_data row
      ativo.bdi_code = read_bdi_code row
      ativo.ticker_symbol = read_ticker_symbol row
      ativo.market_type = read_market_type row
      ativo.name = read_name row
      ativo.specification = read_specification row
      ativo.prazo_termo = read_prazo_termo row
      ativo.currency_ref = read_currency_ref row
      ativo.opening_price = read_opening_price row
      ativo.highest_price = read_highest_price row
      ativo.lowest_price = read_lowest_price row
      ativo.average_price = read_average_price row
      ativo.close_price = read_close_price row
      ativo.best_purchase_price = read_best_purchase_price row
      ativo.best_sell_price = read_best_sell_price row
      ativo.total_trading = read_total_trading row
      ativo.total_trading_share= read_total_trading_share row
      ativo.trading_volume = read_trading_volume row
      ativo
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
    
    def converts_to_big_decimal(preco)
      preco_s = preco.to_s
      preco_s.insert(preco_s.size - 2, '.')
      BigDecimal.new(preco_s)
    end
  end
end
