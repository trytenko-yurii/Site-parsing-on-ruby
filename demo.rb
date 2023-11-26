#This is the StartUp file for project
require_relative'main_application'

main_application = MainApplication.new

parser = Parser.new(main_application.user_data['site_Url'])

parser.parse_item
