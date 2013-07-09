
require 'bundler'
Bundler.require(:default, :production)

run Rack::Jekyll.new

config.serve_static_assets = true
