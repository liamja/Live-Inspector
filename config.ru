require 'rubygems'
# Server / Cache
require 'rack/cache'
# require 'memcached'
require 'sinatra'
# App Dependencies
require 'hpricot'
require 'zlib'
# App
require './lib/partials'
require './helpers/parse'
require './main'

run Main