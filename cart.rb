require_relative 'main_application'
require_relative 'item_container'

#This class is needed to store information in different formats and connection ItemContainer
class Cart
  include ItemContainer

    def initialize
        @items = []
    end

    def save_to_file(filename, format)
        case format
        when 'txt'
          save_to_txt(filename)
        when 'json'
          save_to_json(filename)
        when 'csv'
          save_to_csv(filename)
        else
          puts "Unsupported format: #{format}"
        end
      end

    private

    def save_to_txt(filename)
      File.open(filename, 'w') do |file|
        file.puts "Cart contents (TXT):"
        @items.each { |item| file.puts "- #{item}" }
        puts "Cart saved to #{filename} in TXT format."
      end
    end

    def save_to_json(filename)
      json_data = { items: @items }
      File.open(filename, 'w') do |file|
        file.puts JSON.pretty_generate(json_data)
        puts "Cart saved to #{filename} in JSON format."
      end
    end

    def save_to_csv(filename)
      CSV.open(filename, 'w') do |csv|
        csv << ['Item']
        @items.each { |item| csv << [item] }
        puts "Cart saved to #{filename} in CSV format."
      end
    end

end
