class AddAssetQtyToHistoicAssets < ActiveRecord::Migration
  def self.up
    add_column :historical_assets, :quantidade_ativos, :integer
  end

  def self.down
    remove_column :historical_assets, :quantidade_ativos
  end
end
