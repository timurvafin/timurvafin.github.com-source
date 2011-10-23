require 'rubygems'
require 'bundler/setup'
require 'russian'

module Jekyll
  class TagIndex < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = "index.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag.html')

      self.data['title'] = tag
      self.data['tag'] = tag
    end
  end

  class TagsGenerator < Generator
    safe true

    def generate(site)
      site.tags.keys.each do |tag|
        dir = File.join("tags", Russian::transliterate(tag).downcase)
        write_tag_index(site, dir, tag)
      end
    end
    
    def write_tag_index(site, dir, tag)
      index = TagIndex.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end