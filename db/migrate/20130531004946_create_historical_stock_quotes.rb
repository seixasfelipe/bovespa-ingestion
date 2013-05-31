class CreateHistoricalStockQuotes < ActiveRecord::Migration
  def self.up
    create_table :historical_stock_quotes do |t|
      t.string  :filename
      t.string  :origin_code
      t.date    :created_date
      t.integer :stock_quotes_qty
      t.timestamps
    end
  end

  def self.down
    drop_table :historical_stock_quotes
  end
end
