# Flickr Photo Tag.
#
# Generates image from Flickr.
#
# Usage:
#
#   {% flickr_photo flickr_photo_id %}
#
# Example:
#
#   {% flickr_photo 6224018729 %}
#
# Default Configuration (override in _config.yml):
#
# flickr:
#   api_key: 'key'
#   shared_secret: 'secret'
#

require 'rubygems'
require 'bundler/setup'
require 'flickraw'
require 'active_support/all'

module Jekyll
  class FlickrPhotoTag < Liquid::Tag
    class FlickrPhoto
      def initialize(item)
        @item = item
      end

      def title
        @item['title']
      end

      def url
        "http://www.flickr.com/photos/#{@item['owner']['username']}/#{@item['id']}/"
      end

      def thumbnail_url
        "http://farm#{@item['farm']}.staticflickr.com/#{@item['server']}/#{@item['id']}_#{@item['originalsecret']}_o.#{@item['originalformat']}"
      end

      def has_empty_title?
        title =~ /DSC_\d+/
      end
    end

    def initialize(tag_name, config, token)
      super

      @photo_ids  = config.split

      @config = Jekyll.configuration({})['flickr'] || {}
      @config['api_key']        ||= nil
      @config['shared_secret']  ||= nil

      setup_flick_raw
    end

    def setup_flick_raw
      FlickRaw.api_key = @config['api_key']
      FlickRaw.shared_secret = @config['shared_secret']
    end

    def render(context)
<<-EOF
<ul class="gallery">
  #{photos.collect{|photo| render_thumbnail(photo)}.join}
</ul>
EOF
    end

    def render_thumbnail(photo)
<<-EOF
<li>
  #{photo.title unless photo.has_empty_title?}<br>
  <a href="#{photo.url}" target="_blank">
    <img src="#{photo.thumbnail_url}">
  </a>
</li>
EOF
    end

    def photos
      [].tap do |result|
        @photo_ids.each do |id|
          result << FlickrPhoto.new(flickr.photos.getInfo('photo_id' => id))
        end
      end
    end
  end
end

Liquid::Template.register_tag('flickr_photo', Jekyll::FlickrPhotoTag)