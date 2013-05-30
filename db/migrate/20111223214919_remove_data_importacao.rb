class RemoveDataImportacao < ActiveRecord::Migration
  def self.up
    remove_column :historical_assets, :imported_date
  end

  def self.down
    add_column :historical_assets, :imported_date, :date
  end
end
