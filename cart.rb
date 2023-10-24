require_relative 'main_application'

#This class is needed to store information in different formats and connection ItemContainer 
class Cart
    #extend ItemContainer

    def initialize(main_application)
        @main_application = main_application
    end 

    def save_to_file(item)
        File.open(@main_application::FILE_PATH, 'w') { |file| file.write(item) }
        puts "файл створено!!"
    end

    def save_to_csv(item)
        CSV.open(@main_application::CSV_FILE_PATH, "w") do |csv|
            csv << [item.name, item.price, item.description, item.color, item.size, item.picture_link, item.size_guide_link]
        end
        puts "файл csv створено!!"
    end 

    def save_to_json(item)
        json_data = JSON.generate(item.to_h)
        
        File.open(@main_application::JSON_FILE_PATH, 'w') { |file| file.write(json_data) }

        puts "файл json створено!!"
    end
    
end