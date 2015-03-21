require 'yaml'
require 'rack/commonlogger'

require File.expand_path('../lib/dependencies', __FILE__)

require "lita-#{Settings.adapter}" if Settings.adapter != 'shell'

Lita.configure do |config|
  config.robot.name = 'Tohtori'
  config.robot.log_level = :info
  config.robot.adapter = Settings.adapter

  config.redis[:host] = ENV["REDIS"] ? "redis" : "127.0.0.1"
  config.http.port    = ENV["PORT"] || 8080

  config.http.middleware.use Rack::CommonLogger, Lita.logger

  Settings.assign(config)
end
