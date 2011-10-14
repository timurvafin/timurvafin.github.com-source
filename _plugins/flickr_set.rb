# Flickr Set Tag.
#
# Generates image galleries from a Flickr set.
#
# Usage:
#
#   {% flickr_set flickr_username flickr_set_id %}
#
# Example:
#
#   {% flickr_set tsmango 72157625102245887 %}
#
# Default Configuration (override in _config.yml):
#
#   flickr_set:
#     gallery_tag:   'p'
#     gallery_class: 'gallery'
#     a_href:        nil
#     a_target:      '_blank'
#     image_rel:     ''
#     image_size:    's'
#

require 'rubygems'
require 'bundler/setup'
require 'flickraw'
require 'active_support/all'

module Jekyll
  class FlickrSetTag < Liquid::Tag
    def initialize(tag_name, config, token)
      super

      @user = config.split[0]
      @set  = config.split[1]

      @config = Jekyll.configuration({})['flickr_set'] || {}

      @config['gallery_tag']    ||= 'ol'
      @config['gallery_class']  ||= 'gallery'
      @config['a_href']         ||= nil
      @config['a_target']       ||= '_blank'
      @config['image_rel']      ||= ''
      @config['image_size']     ||= 'o'
      @config['api_key']        ||= nil
      @config['shared_secret']  ||= nil
    end

    def render(context)
<<-EOF
<#{@config['gallery_tag']} class="#{@config['gallery_class']}">
  #{photos.collect{|photo| render_thumbnail(photo)}.join}
</#{@config['gallery_tag']}>
EOF
    end

    def render_thumbnail(photo)
<<-EOF
<li>
  #{photo.title}<br>
  <a href="#{photo.url}" target="#{@config['a_target']}">
    <img src="#{photo.thumbnail_url}">
  </a>
</li>
EOF
    end

    def photos
      FlickRaw.api_key = @config['api_key']
      FlickRaw.shared_secret = @config['shared_secret']
      
      @photos = Array.new

      set = flickr.photosets.getPhotos("photoset_id" => @set, "extras" => "date_taken,url_#{@config['image_size']}")
      set["photo"].each do |photo|
        @photos << FlickrPhoto.new(photo, @config['image_size'], set)
      end
      
      @photos.delete_if {|photo| photo.has_empty_title? }
      @photos.sort
    end
  end

  class FlickrPhoto
    def initialize(item, size, set)
      @item, @size, @set = item, size, set
    end

    def title
      @item['title']
    end

    def url
      @url ||= "http://www.flickr.com/photos/#{@set["ownername"]}/#{@item["id"]}/in/set-#{@set["id"]}"
    end

    def thumbnail_url
      @thumbnail_url ||= @item["url_#{@size}"]
    end
    
    def date_taken
      @date_taken ||= @item['datetaken'].to_datetime
    end

    def <=>(photo)
      date_taken <=> photo.date_taken
    end
    
    def has_empty_title?
      title =~ /DSC_\d+/
    end
  end
end

Liquid::Template.register_tag('flickr_set', Jekyll::FlickrSetTag)