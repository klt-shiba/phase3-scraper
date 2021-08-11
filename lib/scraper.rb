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

  def collect_meal

    meals = {}

    menu = self.get_page.css('div.row')

    get_page.css('div.col-12.col-lg-4.meal-type').each do |meal|

        heading = meal.css("div.generic-cart-item").text
        
        meals << heading
        puts heading
    end
    puts menu
end

end


Scraper.new.collect_meal