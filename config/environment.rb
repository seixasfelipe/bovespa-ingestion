require 'active_record'
require 'rails'
require 'standalone_migrations'

if !ENV["RAILS_ENV"]
  ENV["RAILS_ENV"] = ENV["DB"] || ENV["RACK_ENV"] || Rails.env || "development"
end

configuration = StandaloneMigrations::MinimalRailtieConfig.config.database_configuration[Rails.env] 
ActiveRecord::Base.establish_connection(configuration)

