require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './meal.rb'
require_relative './cart.rb'
require_relative './invoice.rb'
require_relative './scraper.rb'
require_relative './menu.rb'

class Plot
    def welcome_customer
        system "clear"
        Scraper.new.collect_meal
        puts ""
        puts "Welcome to Gaiwong chicken"
        puts ""
        puts "Here's our menu"
        puts ""
        Menu.print_menu
        puts ""
        order_food
    end

    def order_food
        puts "Enter the number of dish you would like to order"
        puts ""
        Cart.add_to_cart
        puts ""
        puts "Do you want anything else [Y/N]?"
        puts ""
        yes_or_no
    end

    def yes_or_no
      input = gets
      if input.chomp == "y" || input.chomp == "Y"
        system "clear"
        Menu.print_menu
        puts ""
        order_food
      elsif input.chomp == "n" || input.chomp == "N"
        system "clear"
        Cart.read_items
        puts ""
        Cart.calculate_total
      else
        puts "Sorry can you repeat that [Y/N]?"
        yes_or_no
      end 
    end
end


Plot.new.welcome_customer
