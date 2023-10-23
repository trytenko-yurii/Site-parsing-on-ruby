require_relative 'main_application'
FILE_PATH = "D:/MIT/Lab1/cart_save_to_txt.txt"
CSV_FILE_PATH = "D:/MIT/Lab1/cart_save_to_csv.csv"
JSON_FILE_PATH = "D:/MIT/Lab1/cart_save_to_json.json"

#This class is needed to store information in different formats and connection ItemContainer 
class Cart
    
    def save_to_file(item)
        File.open(FILE_PATH, 'w') { |file| file.write(item) }
        puts "файл створено!!"
    end

    def save_to_csv(item)
        CSV.open(CSV_FILE_PATH, "w") do |csv|
            csv << [item.name, item.price, item.description, item.color, item.size, item.picture_link, item.size_guide_link]
        end
        puts "файл csv створено!!"
    end 

    def save_to_json(item)
        json_data = JSON.generate(item.to_h)
        
        File.open(JSON_FILE_PATH, 'w') { |file| file.write(json_data) }

        puts "файл json створено!!"
    end
    
end