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


    def read_items
      puts ""
      puts "Your order:"
      @@items.map do | item |
        puts "**#{item.name} -- $#{item.price}"
      end
    end


    def calculate_total
        puts ""
        print "Your total is $"
        @@items.reduce(0) do |sum, value|
            sum + value.price.round(2)
        end
        puts ""
    end

end