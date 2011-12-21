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

