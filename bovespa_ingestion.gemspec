lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'historical_assets/version'

# -*- encoding: utf-8 -*-
Gem::Specification.new 'bovespa_ingestion', HistoricQuotes::VERSION do |s|
  s.summary           = "An importer of historical stock quotations from BM&F Bovespa"
  s.description       = "It reads historical files of daily stock quotations, parses each line and inserts into database for future use."
  s.date              = "2013-05-27"
  s.authors           = ["Felipe Seixas", "Rodrigo Fraga"]
  s.email             = "seixasfelipe@gmail.com"
  s.homepage          = "http://github.com/seixasfelipe/bovespa_ingestion"
  s.executables       = ["carregar_historico"]
  s.files             = `git ls-files`.split("\n") - %w[.gitignore .travis.yml]
  s.test_files        = s.files.select { |p| p =~ /^test\/.*_test.rb/ }
  s.extra_rdoc_files  = s.files.select { |p| p =~ /^README/ } << 'LICENSE'
  s.licenses          = ["MIT"]
  s.require_paths     = ["lib"]
  s.rubygems_version  = "2.0.3"

  s.add_dependency 'activerecord', '>= 3'
  s.add_dependency 'standalone_migrations'
end

