class Menu

  def self.print_menu
    Meal.all.each do |meal|
      puts "#{meal.id}. #{meal.name} -- $#{meal.price}"
    end
  end    

end