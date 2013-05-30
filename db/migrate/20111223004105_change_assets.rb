class ChangeAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :historico_ativo_id, :integer
    add_index :assets, :historico_ativo_id
  end

  def self.down
    remove_column :assets, :historico_ativo_id
  end
end
