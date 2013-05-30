class CreateHistoric < ActiveRecord::Migration
  def self.up
    create_table :historical_assets do |t|
      t.string :filename
      t.string :origin_code
      t.date :data_geracao
      t.date :data_importacao
      t.timestamps
    end
  end

  def self.down
    drop_table :historical_assets
  end
end
