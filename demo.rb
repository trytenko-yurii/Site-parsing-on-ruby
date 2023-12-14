#This is the StartUp file for project
require_relative'main_application'
require_relative'MyApplicationTrytenko'

main_application = MyApplicationTrytenko::MainApplication.new('https://www.chubbiesshorts.com/collections/clearance', 'povel3516@gmail.com', 'Rubyproject12345', 'D:/University/MIT/Site-parsing-on-ruby/')

parser = MyApplicationTrytenko::Parser.new(main_application.user_data['site_Url'], main_application.data_path)

parser.parse_item
