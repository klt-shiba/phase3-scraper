require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './meal.rb'

class Scraper

  def get_page

    html = open("https://gaiwong.com.au/online-order-menu/")
    doc = Nokogiri::HTML(html)
    # binding.pry
  end

  def get_menu
    get_page.css("div.et_pb_module.et_pb_shop")
  end

  def collect_meal

    meals = []

    get_menu.css('li.product.type-product').each do |meal|

        item = Meal.new()
        item.name = meal.css("h2.woocommerce-loop-product__title").text.strip
        item.price = meal.css("span.woocommerce-Price-amount bdi").text
        
    end

    Meal.all.each do |meal|
        puts "#{meal.name} -- #{meal.price}"
    end
  
end

end


Scraper.new.collect_meal