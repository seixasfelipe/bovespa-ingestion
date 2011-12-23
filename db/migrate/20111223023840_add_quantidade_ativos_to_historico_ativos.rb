class AddQuantidadeAtivosToHistoricoAtivos < ActiveRecord::Migration
  def self.up
    add_column :historico_ativos, :quantidade_ativos, :integer
  end

  def self.down
    remove_column :historico_ativos, :quantidade_ativos
  end
end
