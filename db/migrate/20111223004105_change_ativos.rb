class ChangeAtivos < ActiveRecord::Migration
  def self.up
    add_column :ativos, :historico_ativo_id, :integer
    add_index :ativos, :historico_ativo_id
  end

  def self.down
    remove_column :ativos, :historico_ativo_id
  end
end
