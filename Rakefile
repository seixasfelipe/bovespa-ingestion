require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new 'rspec' do |t|
  t.pattern = 'spec/historico_ativos/*_spec.rb'
  t.rspec_opts = ['--tty', '--color', '--format documentation']
end

task :default => [:rspec]

