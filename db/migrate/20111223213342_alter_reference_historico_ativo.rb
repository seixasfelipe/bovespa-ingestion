class AlterReferenceHistoricoAtivo < ActiveRecord::Migration
  def self.up
    remove_index :ativos, :historico_ativo_id
    rename_column :ativos, :historico_ativo_id, :historico_id
    add_index :ativos, :historico_id
  end

  def self.down
    remove_index :ativos, :historico_id
    rename_column :ativos, :historico_id, :historico_ativo_id
    add_index :ativos, :historico_ativo_id
  end
end
