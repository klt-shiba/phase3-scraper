class Menu

  def self.print_menu
    Meal.all.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} -- $#{meal.price}"
    end
  end    

end