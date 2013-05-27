require 'rake'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'standalone_migrations'
StandaloneMigrations::Tasks.load_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new :rspec do |t|
  t.pattern = 'spec/historico_ativos/*_spec.rb'
  t.rspec_opts = ['--tty', '--color', '--format documentation']
end

task default: :rspec
