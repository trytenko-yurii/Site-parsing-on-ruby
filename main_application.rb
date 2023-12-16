require_relative 'item'
require_relative 'cart'
require_relative 'parser'
require_relative 'item_container'
require_relative 'user'
require_relative 'zipper'

#This class is needed to save user settings

module MyApplicationTrytenko
  class MainApplication

    attr_accessor :user_data, :data_path

    def initialize(site_url, user, data_path)
      @user_data = {
        'site_Url' => site_url,
        'user_Credentials' => user
      }

      @data_path = data_path

      setup_dependencies
    end

    def setup_dependencies
      require 'bundler/setup'
      require 'csv'
      require 'json'
      require 'yaml'
      require 'zip'
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
end
