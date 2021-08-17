require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './meal.rb'
require_relative './cart.rb'
require_relative './invoice.rb'
require_relative './scraper.rb'
require_relative './menu.rb'
require_relative './orders.rb'

class Plot
  
    def welcome_customer
        system "clear"
        Scraper.new.collect_meal
        puts ""
        puts "Welcome to Gaiwong chicken"
        puts "We love food. More specifically, we love Malaysian comfort food!"
        puts "Whether it’s after a long hard day,"
        puts "or catching up with friends and family over a weekend,"
        puts "food brings everyone together."
        puts ""
        is_customer_ordering
    end

    def is_customer_ordering
      puts ""
      puts "Would you like to make an order [Y/N]?"
      puts ""
      yes_or_no_customer_ordering
    end

    def say_goodbye
      puts ""
      puts "Thanks for coming, we hope to see you again!"
      puts ""
    end


    def yes_or_no_customer_ordering
      input = gets
      if input.chomp == "y" || input.chomp == "Y"
        puts ""
        # Add an order class
        show_customer_menu
      elsif input.chomp == "n" || input.chomp == "N"
        system "clear"
        say_goodbye
        puts ""
      else
        system "clear"
        puts "Sorry can you repeat that [Y/N]?"
        yes_or_no_customer_ordering
      end 
    end

    def show_customer_menu
      system "clear"
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
        yes_or_no_order_food
    end
    
    def yes_or_no_order_food
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
        say_goodbye
      else
        system "clear"
        puts "Sorry can you repeat that [Y/N]?"
        yes_or_no_order_food
      end 
    end
end

