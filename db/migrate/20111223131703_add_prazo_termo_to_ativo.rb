class AddPrazoTermoToAtivo < ActiveRecord::Migration
  def self.up
    add_column :ativos, :prazo_termo, :integer
  end

  def self.down
    remove_column :ativos, :prazo_termo
  end
end
