class RemoveDataImportacao < ActiveRecord::Migration
  def self.up
    remove_column :historical_assets, :data_importacao
  end

  def self.down
    add_column :historical_assets, :data_importacao, :date
  end
end
