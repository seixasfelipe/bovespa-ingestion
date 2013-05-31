class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.date :date
      t.string :bdi_code
      t.string :code
      t.string :market_type
      t.string :name
      t.string :spec
      t.string :currency_ref
      t.decimal :opening_price
      t.decimal :max_price
      t.decimal :min_price
      t.decimal :medium_price
      t.decimal :last_price
      t.decimal :best_option_purch_price
      t.decimal :best_option_sell_price
      t.decimal :total_trans
      t.decimal :total_share_trans
      t.decimal :vol_trans
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
