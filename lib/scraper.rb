  class Scraper

    def get_page
      html = open("https://gaiwong.com.au/online-order-menu/")
      doc = Nokogiri::HTML(html)
    end

    def get_food
      get_page.css("div.et_pb_module.et_pb_shop")
    end

    def collect_meal
      get_food.css('li.product.type-product').each do |meal|
        item = Meal.new()
        item.name = meal.css("h2.woocommerce-loop-product__title").text.strip
        price = meal.css("span.woocommerce-Price-amount bdi").text
        price[0] = ""
        item.price = price.to_f
      end
    end
    
  end

