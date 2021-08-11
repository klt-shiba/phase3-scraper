require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './clothes.rb'

class Scraper

  def get_page

    html = open("https://www.kfc.com.au/menu/burgers")
    doc = Nokogiri::HTML(html)
    # binding.pry
  end

  def get_menu
    self.get_page
  end

  def collect_meal

    meals = {}

    self.get_menu.css('div.col-lg-4.meal-type').each do |meal|

        heading = meal.css("div.generic-cart-item").text
        meals << heading
    end
    puts self.get_menu
    end

end


Scraper.new.collect_meal