#This is the StartUp file for project
require_relative'main_application'
require_relative'my_application_trytenko'

user = MyApplicationTrytenko::User.new('povel3516@gmail.com', 'Rubyproject12345')
main_application = MyApplicationTrytenko::MainApplication.new('https://www.chubbiesshorts.com/collections/clearance', user, 'D:/University/MIT/Site-parsing-on-ruby/')

parser = MyApplicationTrytenko::Parser.new(main_application.user_data['site_Url'], main_application.data_path)

parser.parse_item

zipper = MyApplicationTrytenko::Zipper.new('ruby.zip', 'rb')
zipper.add_file('cart.rb')
zipper.create_archive
