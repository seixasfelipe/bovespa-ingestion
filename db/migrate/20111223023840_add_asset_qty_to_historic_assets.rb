class AddAssetQtyToHistoicAssets < ActiveRecord::Migration
  def self.up
    add_column :historical_assets, :asset_qty, :integer
  end

  def self.down
    remove_column :historical_assets, :asset_qty
  end
end
