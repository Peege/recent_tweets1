# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'twitter'


# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')


$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "eV08vMkVu1fxrladufmXk2NYq"
  config.consumer_secret     = "Ddh4sVOBDH9Ubdjr1ardV3sVPOSMHY1mAzVTflbu8HHJC8fkkq"
  config.access_token        = "2908549764-H2U2C81x4N5jYt6CBXyQYfBwU3Pr1gqR0aCikZK"
  config.access_token_secret = "p69SvtXrrxzu0katqMoo2q46Ij3K6zX6TWEDqzvp3w8AW"
end
