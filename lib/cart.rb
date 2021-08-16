
class Cart

    @@all = []
    @@items = []

    def initialize
        @@all << self
        @@items
    end

    def add_item(item)
        @@items << item
    end

    def calculate_price(item)
        @@items << item
    end

    def self.read_items
      puts ""
      puts "Your order:"
      @@items.map do | item |
        puts "**#{item.name} -- $#{item.price}"
      end
    end

    def self.calculate_total
        puts ""
        total = 0
        @@items.each do |item|
          value = item.price
          total += value.to_i
        end
        puts "Your total is $#{total.round(2)}"
        puts ""
    end

    def self.add_to_cart
      input = gets
      meal = Meal.find_meal(input.chomp)
      cart = Cart.new
      cart.add_item(meal)
      system "clear" 
      puts "We've added #{meal.name} to your order."
      puts Cart.read_items
    end
end
