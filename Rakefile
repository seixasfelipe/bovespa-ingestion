require 'rake'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

begin
  require 'tasks/standalone_migrations'
rescue LoadError => e
  puts "gem install standalone_migrations to get db:migrate:* tasks! (Error: #{e})"
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bovespa_ingestion"
  gem.homepage = "http://github.com/seixasfelipe/bovespa_ingestion"
  gem.license = "MIT"
  gem.summary = "An importer of historical stock quotations from BM&F Bovespa"
  gem.description = "An importer of historical stock quotations from BM&F Bovespa"
  gem.email = "seixasfelipe@gmail.com"
  gem.authors = ["Felipe Seixas", "Rodrigo Fraga"]
  gem.executables = ['carregar_historico']
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new :rspec do |t|
  t.pattern = 'spec/historico_ativos/*_spec.rb'
  t.rspec_opts = ['--tty', '--color', '--format documentation']
end

task default: :rspec

require 'rake/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "bovespa_ingestion #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
