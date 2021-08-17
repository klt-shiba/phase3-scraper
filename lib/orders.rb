class Orders

    @@all = []

    attr_accessor :id, :order_items

    def initialize(id: nil)
        self.id = id
        self.order_items = []
        @@all << self
    end

end