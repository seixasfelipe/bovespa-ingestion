require 'spec_helper'

module HistoricoAtivos
  describe Ativo do

    it "deveria ser activerecord" do
      ativo = Ativo.new
      ativo.should be_kind_of(ActiveRecord::Base)
    end

  end
end
