#This is the StartUp file for project

require_relative'main_application'

cart = Cart.new
item = Item.new 'name', 'afafadfsd', 100, 'red', 29, 'asd', 'asd'

puts item

cart.save_to_csv(item)
cart.save_to_file(item)
cart.save_to_json(item)