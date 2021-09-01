
class Cart

    @@items = []

    def self.add_item(item)
        @@items << item
    end

    def self.read_items
      puts ""
      puts "\u{1F37D} Your order:"
      puts ""
      @@items.map do | item |
        puts "\u{2714} #{item.name} -- $#{item.price}"
        puts ""
        puts "  -#{item.description}"
        puts ""
      end
    end

    def self.calculate_total
        puts ""
        total = 0
        @@items.each do |item|
          value = item.price
          total += value.to_i
        end
        puts "\u{1F4B0}Your total is $#{total.round(1)}"
        puts ""
    end

    def self.add_to_cart
      input = gets
      meal = Meal.find_meal(input.chomp)
      self.add_item(meal)
      system "clear" 
      puts "We've added #{meal.name} to your order."
      puts Cart.read_items
    end
end
