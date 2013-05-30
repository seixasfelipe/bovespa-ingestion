class AlterReferenceHistoricoAtivo < ActiveRecord::Migration
  def self.up
    remove_index :assets, :historico_ativo_id
    rename_column :assets, :historico_ativo_id, :historico_id
    add_index :assets, :historico_id
  end

  def self.down
    remove_index :assets, :historico_id
    rename_column :assets, :historico_id, :historico_ativo_id
    add_index :assets, :historico_ativo_id
  end
end
