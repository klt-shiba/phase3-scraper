
class Meal
    
    attr_accessor :id, :name, :price, :description

    @@all = []

    def initialize(id: nil)
        self.id = id
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset_all
        @@all.clear
    end

    def self.find_meal(item_number)
        index_number = (item_number.to_i - 1)
        @@all.fetch(index_number)
    end
end
