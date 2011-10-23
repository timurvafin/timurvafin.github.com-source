require 'rubygems'
require 'bundler/setup'
require 'russian'

module Jekyll
  module TransliterateFilter
    include Russian::Transliteration
  end
end

Liquid::Template.register_filter(Jekyll::TransliterateFilter)
