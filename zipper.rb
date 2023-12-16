require_relative'main_application'

require 'zip'

module MyApplicationTrytenko
  class Zipper
    def initialize(zip_file_name, allowed_type)
      @zip_file_name = zip_file_name
      @files_to_zip = []
      @allowed_type = allowed_type
    end

    def add_file(file_path)
      if allowed_file?(file_path)
        @files_to_zip << file_path
      else
        puts "Skipping file #{file_path}. Not allowed type."
      end
    end

    def create_archive
      Zip::File.open(@zip_file_name, Zip::File::CREATE) do |zipfile|
        @files_to_zip.each do |file|
          zipfile.add(File.basename(file), file)
        end
      end

      puts "Archive #{@zip_file_name} created successfully."
    end

    private

    def allowed_file?(file_path)
      @allowed_type.nil? || File.extname(file_path) == @allowed_type
    end
  end
end

# Приклад використання класу Zipper
zipper = MyApplicationTrytenko::Zipper.new('ruby.zip', '.rb')
zipper.add_file('cart.rb')
zipper.create_archive
