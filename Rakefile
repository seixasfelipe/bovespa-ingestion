require 'rake'
require 'rspec/core/rake_task'

begin
  require 'tasks/standalone_migrations'
rescue LoadError => e
  puts "gem install standalone_migrations to get db:migrate:* tasks! (Error: #{e})"
end

RSpec::Core::RakeTask.new 'rspec' do |t|
  t.pattern = 'spec/historico_ativos/*_spec.rb'
  t.rspec_opts = ['--tty', '--color', '--format documentation']
end

task :default => [:rspec]

# rake install -> install gem locally (for tests)
# rake release -> push to github and release to gemcutter
# rake version:bump:patch -> increase version and add a git-tag
begin
  require 'jeweler'
rescue LoadError => e
  $stderr.puts "Jeweler, or one of its dependencies, is not available:"
  $stderr.puts "#{e.class}: #{e.message}"
  $stderr.puts "Install it with: sudo gem install jeweler"
else
  Jeweler::Tasks.new do |gem|
    gem.name = 'bovespa_ingestion'
    gem.summary = "An importer of historical quotations from BM&F Bovespa"
    gem.email = "seixasfelipe@gmail.com"
    gem.homepage = "http://github.com/seixasfelipe/bovespa-ingestion"
    gem.authors = ["Felipe Seixas", "Rodrigo Fraga"]
  end

  Jeweler::GemcutterTasks.new
end

