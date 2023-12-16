#In this file we parse the site
require 'bundler/setup'
Bundler.require
require_relative 'main_application'
require_relative'my_application_trytenko'

module MyApplicationTrytenko
    class Parser

        def initialize(page_url, data_path)
            @page_url = page_url
            @data_path = data_path
            #@counter = counter
        end

        def extract_numeric_value(text)
            text.scan(/\d+\.\d+/).first.to_f
        end

        def parse_item
            cart = Cart.new()
            document = Nokogiri::HTML(URI.open(@page_url))
            all_Goods = document.css('.Uf45r.H8lvh')

            all_Goods.each do |element|
                original_price_text = element.at('.chubbies-module_sr-only__pxyL2:contains("Original Price")').text.strip
                current_price_text = element.at('.chubbies-module_sr-only__pxyL2:contains("Current Price")').text.strip

                item = Item.new(element.css('.JffJ-').text, element.css('.LPZ-z').text, extract_numeric_value(original_price_text), extract_numeric_value(current_price_text), element.css('.chubbies-module_variantName__bMiO3').text, element.at('img')['src'])

                cart.add_item(item)
            end
            #puts document

            cart.save_to_file('All Goods.txt', 'txt', @data_path)
        end

    end
end
