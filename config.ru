require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require './app'
require 'rmagick'
run Sinatra::Application