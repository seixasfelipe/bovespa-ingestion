class ChangeAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :historic_asset_id, :integer
    add_index :assets, :historic_asset_id
  end

  def self.down
    remove_column :assets, :historic_asset_id
  end
end
