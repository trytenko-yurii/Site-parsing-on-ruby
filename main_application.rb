require 'bundler/setup'
require 'csv'
require 'json'

require_relative 'item'
require_relative 'cart'
require_relative 'parser'
require_relative 'item_container'

PAGE_URL = "https://www.chubbiesshorts.com/"
FILE_PATH = "D:/MIT/Lab1/cart_save_to_txt.txt"
CSV_FILE_PATH = "D:/MIT/Lab1/cart_save_to_csv.csv"
JSON_FILE_PATH = "D:/MIT/Lab1/cart_save_to_json.json"

Bundler.require
#This class is needed to save user settings

class MainApplication

end