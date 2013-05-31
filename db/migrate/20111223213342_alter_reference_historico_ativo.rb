class AlterReferenceHistoricoAtivo < ActiveRecord::Migration
  def self.up
    remove_index :assets, :historic_asset_id
    rename_column :assets, :historic_asset_id, :historico_id
    add_index :assets, :historico_id
  end

  def self.down
    remove_index :assets, :historico_id
    rename_column :assets, :historico_id, :historic_asset_id
    add_index :assets, :historic_asset_id
  end
end
