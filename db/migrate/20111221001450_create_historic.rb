class CreateHistoric < ActiveRecord::Migration
  def self.up
    create_table :historical_assets do |t|
      t.string :filename
      t.string :origin_code
      t.date :created_date
      t.date :imported_date
      t.timestamps
    end
  end

  def self.down
    drop_table :historical_assets
  end
end
