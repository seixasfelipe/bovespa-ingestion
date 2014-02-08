class AddPrecisionAndScaleToDecimals < ActiveRecord::Migration
  def self.up
    change_column :stock_quotes, :opening_price, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :highest_price, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :lowest_price, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :average_price, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :close_price, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :best_purchase_price, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :best_sell_price, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :total_trading, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :total_trading_share, :decimal, :precision => 10, :scale => 2
    change_column :stock_quotes, :trading_volume, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    change_column :stock_quotes, :opening_price, :decimal
    change_column :stock_quotes, :highest_price, :decimal
    change_column :stock_quotes, :lowest_price, :decimal
    change_column :stock_quotes, :average_price, :decimal
    change_column :stock_quotes, :close_price, :decimal
    change_column :stock_quotes, :best_purchase_price, :decimal
    change_column :stock_quotes, :best_sell_price, :decimal
    change_column :stock_quotes, :total_trading, :decimal
    change_column :stock_quotes, :total_trading_share, :decimal
    change_column :stock_quotes, :trading_volume, :decimal
  end
end
