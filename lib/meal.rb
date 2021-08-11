class Meal
    
    attr_accessor :name, :price

    @@all = []

    def initialize()
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset_all
        @@all.clear
    end

end