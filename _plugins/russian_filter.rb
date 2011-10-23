require 'rubygems'
require 'bundler/setup'
require 'russian'

module Jekyll
  module RussianFilter
    include Russian
  end
end

Liquid::Template.register_filter(Jekyll::RussianFilter)
