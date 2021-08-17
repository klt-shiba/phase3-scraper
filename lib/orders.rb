class Orders

    @@all = []
    @@order_items = []


    attr_accessor :id

    def initialize(id: nil)
        self.id = id
        @@all << self
    end

end