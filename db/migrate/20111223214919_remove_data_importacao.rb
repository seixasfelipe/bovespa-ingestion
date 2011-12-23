class RemoveDataImportacao < ActiveRecord::Migration
  def self.up
    remove_column :historico_ativos, :data_importacao
  end

  def self.down
    add_column :historico_ativos, :data_importacao, :date
  end
end
