require 'bundler'
Bundler.require

require_relative './settings'

Dir[File.expand_path('../*.rb', __FILE__), File.expand_path('../**/*.rb', __FILE__)].each do |file|
  require file
end
