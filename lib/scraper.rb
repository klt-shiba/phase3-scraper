require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './meal.rb'
require_relative './cart.rb'

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
        price = meal.css("span.woocommerce-Price-amount bdi").text
        price[0] = ""
        item.price = price.to_f
    end
  end


  def print_menu
    system "clear" 
    collect_meal
    puts ""
    Meal.all.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}"
      puts "    -$#{meal.price}"
      puts ""
    end
    add_to_cart
  end

  def add_to_cart
     puts "Enter the number of the meal you want to order?"
      input = gets
      meal = Meal.find_meal(input.chomp)
      cart = Cart.new
      cart.add_item(meal)
      system "clear" 
      puts "We've added #{meal.name} to your cart."
      puts cart.read_items
      puts "Do you want anything else [Y/N]?"
      add_another_to_cart(cart)
  end

  def add_another_to_cart(cart)
     input = gets
     if input.chomp == "y"
      add_to_cart
     else 
      puts "Thank you"
      cart.calculate_total
     end
  end

end


Scraper.new.print_menu