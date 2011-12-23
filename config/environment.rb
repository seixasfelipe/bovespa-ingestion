require 'active_record'
require 'yaml'

config_path = ::File.expand_path('../../db/config.yml',  __FILE__)
db_config = YAML.load_file(config_path)

ActiveRecord::Base.establish_connection(
  db_config['development']
  )

