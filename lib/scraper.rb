require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './clothes.rb'

class Scraper

  def get_page

    html = open("website url goes here")
    doc = Nokogiri::HTML(html)

    binding.pry
  end

end

Scraper.new.get_page