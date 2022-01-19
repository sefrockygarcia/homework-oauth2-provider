# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

if ENV['CLIENT_URL'].blank?
  raise 'Please set ENV variable CLIENT_URL!'
end

run Rails.application
Rails.application.load_server
