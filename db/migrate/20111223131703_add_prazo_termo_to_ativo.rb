class AddPrazoTermoToAtivo < ActiveRecord::Migration
  def self.up
    add_column :assets, :prazo_termo, :integer
  end

  def self.down
    remove_column :assets, :prazo_termo
  end
end
