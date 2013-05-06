require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require './app'
require 'RMagick'
run Sinatra::Application