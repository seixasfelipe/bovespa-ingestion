require 'active_record'
require 'yaml'

p ENV['APP_ENV']
# by default, app environment is development
ENV['APP_ENV'] ||= 'development'
p ENV['APP_ENV']

config_path = ::File.expand_path('../../db/config.yml',  __FILE__)
db_config = YAML.load_file(config_path)

ActiveRecord::Base.establish_connection(
  db_config[ENV['APP_ENV']]
  )

