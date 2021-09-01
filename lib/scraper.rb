  class Scraper

    def get_page
      html = open("https://gaiwong.com.au/online-order-menu/")
      Nokogiri::HTML(html)
    end

    def get_food
      get_page.css("div.et_pb_module.et_pb_shop")
    end

    def get_description(url)
      html = open(url)
      doc = Nokogiri::HTML(html)
      doc.css("div.et_pb_wc_description").text.strip
    end
    
    def collect_meal
      id = 0
      puts "Loading food"
      get_food.css('li.product.type-product').each do |meal|
        print "="
        item = Meal.new()
        item.name = meal.css("h2.woocommerce-loop-product__title").text.strip
        price = meal.css("span.woocommerce-Price-amount bdi").text
        # $4.00
        price[0] = ""
        item.price = price.to_f
        id += 1
        item.id = id
        url = meal.css("a.woocommerce-LoopProduct-link").attr("href")
        item.description = get_description(url)
      end
    end
    
  end

