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
      ativo.code = read_code row
      ativo.market_type = read_market_type row
      ativo.name = read_name row
      ativo.spec = read_spec row
      ativo.prazo_termo = read_prazo_termo row
      ativo.currency_ref = read_currency_ref row
      ativo.opening_price = read_opening_price row
      ativo.max_price = read_max_price row
      ativo.min_price = read_min_price row
      ativo.medium_price = read_medium_price row
      ativo.last_price = read_last_price row
      ativo.best_option_purch_price = read_best_option_purch_price row
      ativo.best_option_sell_price = read_best_option_sell_price row
      ativo.total_trans = read_total_trans row
      ativo.total_share_trans= read_total_share_trans row
      ativo.vol_trans = read_vol_trans row
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

    def read_code(row)
      row[12..23].strip
    end

    def read_market_type(row)
      row[24..26].to_i
    end

    def read_name(row)
      row[27..38].strip
    end

    def read_spec(row)
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

    def read_max_price(row)
      converts_to_big_decimal row[69..81].to_i
    end

    def read_min_price(row)
      converts_to_big_decimal row[82..94].to_i
    end

    def read_medium_price(row)
      converts_to_big_decimal row[95..107].to_i
    end
    
    def read_last_price(row)
      converts_to_big_decimal row[108..120].to_i
    end
    
    def read_best_option_purch_price(row)
      converts_to_big_decimal row[121..133].to_i
    end
    
    def read_best_option_sell_price(row)
      converts_to_big_decimal row[134..146].to_i
    end
    
    def read_total_trans(row)
      row[147..151].to_i
    end
    
    def read_total_share_trans(row)
      BigDecimal.new(row[152..169])
    end
    
    def read_vol_trans(row)
      BigDecimal.new(row[170..187])
    end
    
    def converts_to_big_decimal(preco)
      preco_s = preco.to_s
      preco_s.insert(preco_s.size - 2, '.')
      BigDecimal.new(preco_s)
    end
  end
end
