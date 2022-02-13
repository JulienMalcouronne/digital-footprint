# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

require ::File.expand_path('../config/environment',  __FILE__)
require 'bootstrap-sass' #require statement of bootstrap-sass

run Rails.application
Rails.application.load_server
