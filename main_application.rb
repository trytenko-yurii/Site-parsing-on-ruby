require_relative 'item'
require_relative 'cart'
require_relative 'parser'
require_relative 'item_container'

#This class is needed to save user settings
class MainApplication

  attr_accessor :user_data, :data_path

  def initialize
    @user_data = {
      'site_Url' => 'https://www.chubbiesshorts.com/collections/clearance',
      'user_Credentials' =>{
        'login' => 'povel3516@gmail.com',
        'password' => 'Rubyproject12345'
      }
    }

    @data_path = 'D:/University/MIT/Site-parsing-on-ruby/'

    setup_dependencies
  end

  def setup_dependencies
    require 'bundler/setup'
    require 'csv'
    require 'json'
  end

  def save_user_data
    File.open("#{@data_path}/user_data.json", 'w') do |file|
      file.puts JSON.pretty_genetate(@user_data)
    end
  end

  def load_user_data
    file_path = "#{@data_path}/user_data.json"

    if File.exist?(file_path)
      file_content = File.read(file_path)
      @user_data = JSON.parse(file_content)
    else
      puts 'File not found!'
    end
  end


end
