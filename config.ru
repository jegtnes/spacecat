require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require './app'
require 'mini_magick'
run Sinatra::Application