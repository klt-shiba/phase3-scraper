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

  def get_food
    get_page.css("div.et_pb_module.et_pb_shop")
  end

  def collect_meal

    meals = []

    puts ""
    puts ""
    puts "What do you want to order?"
    get_food.css('li.product.type-product').each do |meal|
        print "="
        item = Meal.new()
        item.name = meal.css("h2.woocommerce-loop-product__title").text.strip
        item.price = meal.css("span.woocommerce-Price-amount bdi").text
    end
  end


  def print_menu
    system "clear" 
    collect_meal
    puts ""
    Meal.all.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}"
      puts "--- #{meal.price}"
      puts ""
    end
  end
end


Scraper.new.print_menu