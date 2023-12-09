require_relative 'main_application'
require_relative 'item_container'

#This class is needed to store information in different formats and connection ItemContainer

module MyApplicationTrytenko
  class Cart
    include ItemContainer

      def initialize
          @items = []
      end

      def save_to_file(filename, format, data_path)
          case format
          when 'txt'
            save_to_txt(filename, data_path)
          when 'json'
            save_to_json(filename, data_path)
          when 'csv'
            save_to_csv(filename, data_path)
          when 'yml'
            save_to_yml(filename, data_path)
          else
            puts "Unsupported format: #{format}"
          end
        end

      private

      def save_to_yml(filename, data_path)

        full_path = data_path ? File.join(data_path, filename) : File.join(File.dirname(__FILE__), filename)

        File.open(full_path, 'w') do |file|
          file.write(YAML.dump(@items))
        end

        puts "Cart saved to #{filename} in YAML format."
      end

      def save_to_txt(filename, data_path)

        full_path = data_path ? File.join(data_path, filename) : File.join(File.dirname(__FILE__), filename)

        File.open(full_path, 'w') do |file|
          file.puts "Cart contents (TXT):"
          @items.each { |item| file.puts "- #{item}" }
        end

        puts "Cart saved to #{filename} in TXT format."
      end

      def save_to_json(filename, data_path)

        json_data = { items: @items }

        full_path = data_path ? File.join(data_path, filename) : File.join(File.dirname(__FILE__), filename)

        File.open(filename, 'w') do |file|
          file.puts JSON.pretty_generate(json_data)
        end

        puts "Cart saved to #{filename} in JSON format."
      end

      def save_to_csv(filename, data_path)

        full_path = data_path ? File.join(data_path, filename) : File.join(File.dirname(__FILE__), filename)

        CSV.open(filename, 'w') do |csv|
          csv << ['Item']
          @items.each { |item| csv << [item] }
        end

        puts "Cart saved to #{filename} in CSV format."
      end

  end
end
